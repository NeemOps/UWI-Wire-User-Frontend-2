import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:uwiwire_vendor/constants.dart';

import '../send_peli_screen.dart';

class PeerScanner extends StatefulWidget {
  const PeerScanner({super.key});

  @override
  State<PeerScanner> createState() => _PeerScannerState();
}

class _PeerScannerState extends State<PeerScanner> {
  final GlobalKey _globalKey = GlobalKey();
  QRViewController? controller;
  static Barcode? walletAddr;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        walletAddr = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Center(
          child: Container(
            color: kPrimaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: 400,
                  child: QRView(
                    key: _globalKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: AlignmentDirectional.bottomCenter,
          padding: const EdgeInsets.only(bottom: 30),
          child: ElevatedButton(
            child: (walletAddr != null)
                ? const Text('SEND PELI')
                : const Text('Scan QR', style: TextStyle(fontSize: 20)),
            onPressed: () {
              if (walletAddr != null) {
                dynamic addr = walletAddr!.code;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SendPeliScreen(walletAddr: addr),
                  ),
                );
              }
            },
          ),
        )
      ]),
    );
  }
}
