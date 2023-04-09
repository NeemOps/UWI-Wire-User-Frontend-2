import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MetamaskScreen extends StatefulWidget {
  const MetamaskScreen({super.key});

  @override
  State<MetamaskScreen> createState() => _MetamaskScreenState();
}

class _MetamaskScreenState extends State<MetamaskScreen> {
  var _session, _uri;

  var connector = WalletConnect(
    bridge: 'https://bridge.walletconnect.org',
    clientMeta: const PeerMeta(
      name: 'UWIwire',
      description: 'An app for converting pictures to NFT',
      url: 'https://uwi-wire.herokuapp.com/',
      icons: [],
    ),
  );

  @override
  Widget build(BuildContext context) {
    connector.on(
      'connect',
      (session) => setState(() {
        _session = _session;
      }),
    );

    connector.on(
      'session_update',
      (payload) => setState(() {
        _session = payload;
        print(payload.toString());
        print(payload.toString());
      }),
    );

    connector.on(
      'disconnect',
      (payload) => setState(() {
        _session = null;
      }),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (_session != null)
                  ? WalletInfo(session: _session)
                  : ElevatedButton(
                      onPressed: () => connectMetamask(context),
                      child: const Text("Connect Metamask"),
                    )
            ],
          ),
        ),
      ),
    );
  }

  connectMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          _uri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });

        setState(() {
          _session = session;
        });
      } catch (exp) {
        print(exp);
      }
    }
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
            Text(
              'Account',
              style:
                  GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            // Display Account Address
            Text(
              '${_session.accounts[0]}',
              style: GoogleFonts.inconsolata(fontSize: 16),
            ),
          ],
        ));
  }
}
