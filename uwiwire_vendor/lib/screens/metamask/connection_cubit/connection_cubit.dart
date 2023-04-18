import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

import '../../../backend/authentication/_authentication_command.dart';
import '../../../backend/authentication/_authentication_controller.dart';
import '../../../backend/authentication/_update_address_command.dart';
import '../../../repository/keys.dart';
import '../../../repository/repository.dart';

part 'connection_state.dart';

class ConnectionCubit extends Cubit<MetamaskConnectionState> {
  final WalletConnect connector;

  ConnectionCubit({required this.connector}) : super(ConnectionInitial());

  AuthenticationController authController = AuthenticationController();
  AuthenticationCommand updateAddressCommand = UpdateAddressCommand();

  // ignore: unused_field
  dynamic _session;
  String wcURI = '';

  void initiateListeners() {
    if (connector.connected) {
      emit(
        ConnectionSuccess(
          session: SessionStatus(
            accounts: connector.session.accounts,
            chainId: connector.session.chainId,
          ),
        ),
      );

      return;
    }

    connector.on('connect', (Object? session) async {
      emit(
        ConnectionSuccess(session: session),
      );
    });

    connector.on('session_update', (Object? session) {
      _session = session;
    });

    connector.on('disconnect', (_) async {
      emit(SessionDisconnected());
    });
  }

  Future<void> connectMetamask() async {
    if (!connector.bridgeConnected) {
      connector.reconnect();
    }

    if (!connector.connected) {
      try {
        SessionStatus session = await connector.createSession(
          chainId: 868,
          onDisplayUri: (uri) async {
            wcURI = uri;
            emit(MetamaskConnectionSuccess(url: uri));
          },
        );

        _session = session;

        Repository repo = Repository();
        try {
          await repo.write(addrKey, _session.accounts[0]);
        } catch (e) {
          print(e.toString());
        }

        authController.setCommand(updateAddressCommand);
        try {
          await authController.authenticate();
        } catch (e) {
          print(e.toString());
        }
      } catch (e) {
        emit(MetamaskConnectionFailed(e.toString()));
      }
    }
  }
}
