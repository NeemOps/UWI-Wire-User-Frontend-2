import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../constants.dart';
import '../home/nav_screen.dart';
import '../../backend/web3/_wallet.dart';
import 'connection_cubit/connection_cubit.dart';

class MetamaskScreen extends StatelessWidget {
  MetamaskScreen({super.key});

  final Web3Wallet wallet = Web3Wallet();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectionCubit(connector: wallet.getConnector()),
      child: const Scaffold(
        body: MetamaskBody(),
      ),
    );
  }
}

class MetamaskBody extends StatefulWidget {
  const MetamaskBody({super.key});

  @override
  State<MetamaskBody> createState() => _MetamaskBodyState();
}

class _MetamaskBodyState extends State<MetamaskBody> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
        (_) => context.read<ConnectionCubit>().initiateListeners());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectionCubit, MetamaskConnectionState>(
      listener: (context, state) {
        if (state is ConnectionSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => WalletInfo(
                session: state.session,
              ),
            ),
          );
        }

        if (state is MetamaskConnectionSuccess) {
          launchUrlString(state.url, mode: LaunchMode.externalApplication);
        }

        if (state is MetamaskConnectionFailed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: kPrimaryColor,
                content: Text(state.error),
              ),
            );
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ConnectionCubit>(context).connectMetamask();
                  },
                  child: const Text("Connect Metamask"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WalletInfo extends StatelessWidget {
  final dynamic session;

  const WalletInfo({
    super.key,
    required this.session,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Metamask Connected!',
                style: TextStyle(fontSize: 20, color: kPrimaryColor),
              ),
            ),

            // Whitespace
            const SizedBox(height: 100),

            // Displays Account Address
            Container(
              alignment: Alignment.centerLeft,
              child: Text('Wallet Address: ${session.accounts[0]}'),
            ),

            // Whitespace
            const SizedBox(height: 15),

            // Displays Chain ID
            Container(
              alignment: Alignment.centerLeft,
              child: Text('Chain ID: ${session.chainId}'),
            ),

            // Whitespace
            const SizedBox(height: 100),

            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const NavScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                child: const Text('Home'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
