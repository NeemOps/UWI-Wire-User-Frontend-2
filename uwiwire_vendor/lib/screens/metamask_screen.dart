import 'package:flutter/material.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MetamaskScreen extends StatefulWidget {
  const MetamaskScreen({super.key});

  @override
  State<MetamaskScreen> createState() => _MetamaskScreenState();
}

class _MetamaskScreenState extends State<MetamaskScreen> {
  @override
  Widget build(BuildContext context) {
    var connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'My App',
          description: 'An app for converting pictures to NFT',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]),
    );
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login Page'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => {}, child: const Text("Connect Metamask"))
          ],
        ),
      ),
    );
  }
}
