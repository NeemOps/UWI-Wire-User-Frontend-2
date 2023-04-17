import 'package:flutter/material.dart';
import 'package:uwiwire_vendor/backend/web3/_wallet.dart';
import 'package:uwiwire_vendor/constants.dart';

class MetamaskScreen extends StatefulWidget {
  const MetamaskScreen({super.key});

  @override
  State<MetamaskScreen> createState() => _MetamaskScreenState();
}

class _MetamaskScreenState extends State<MetamaskScreen> {
  var _session;

  Web3Wallet metamask = Web3Wallet();
  var connector;

  @override
  void initState() {
    connector = metamask.connector;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // connector.on(
    //   'connect',
    //   (session) => setState(() {
    //     _session = _session;
    //   }),
    // );

    // connector.on(
    //   'session_update',
    //   (payload) => setState(() {
    //     _session = payload;
    //     print(payload.toString());
    //     print(payload.toString());
    //   }),
    // );

    // connector.on(
    //   'disconnect',
    //   (payload) => setState(() {
    //     _session = null;
    //   }),
    // );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (_session != null)
                  ? WalletInfo(session: _session)
                  : ElevatedButton(
                      onPressed: () {
                        metamask.connectMetamask(context);

                        setState(() {
                          _session = metamask.getSession();
                        });
                      },
                      child: const Text("Connect Metamask"),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class WalletInfo extends StatelessWidget {
  const WalletInfo({
    super.key,
    required session,
  }) : _session = session;

  final _session;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Text('Wallet Address: ${_session.accounts[0]}'),

            // Whitespace
            const SizedBox(height: 15),

            // Displays Chain ID
            Text('Chain ID: ${_session.chainId}'),

            // Whitespace
            const SizedBox(height: 100),

            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/homeRoute');
                },
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                child: const Text('Home'),
              ),
            )
          ],
        ));
  }
}
