import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

import '../../constants.dart';
import '../transactions/_transactions.dart';

class Web3Wallet {
  static final Web3Wallet _instance = Web3Wallet._internal();

  factory Web3Wallet() {
    return _instance;
  }

  Web3Wallet._internal();

  static late SessionStatus _session;

  WalletConnect get connector {
    final WalletConnect connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'UWIwire',
        description: 'An app for digital payments in the UWI',
        url: 'https://uwi-wire.herokuapp.com/',
        icons: [],
      ),
    );

    return connector;
  }

  connectMetamask(BuildContext context) async {
    if (!connector.bridgeConnected) {
      connector.reconnect();
    }

    if (!connector.connected) {
      try {
        SessionStatus session = await connector.createSession(
          onDisplayUri: (uri) async {
            await launchUrlString(uri, mode: LaunchMode.externalApplication);
          },
        );

        _session = session;

        Transactions transaction = Transactions();
        transaction.initializeProvider(_instance);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: kPrimaryColor,
          content: Text(e.toString()),
        ));
      }
    }
  }

  SessionStatus getSession() {
    return _session;
  }

  EthereumWalletConnectProvider getProvider() {
    return EthereumWalletConnectProvider(connector);
  }
}
