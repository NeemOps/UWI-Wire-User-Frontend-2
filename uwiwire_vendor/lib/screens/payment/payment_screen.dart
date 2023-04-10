import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../backend/_account_info.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final AccountInfo _accountInfo = AccountInfo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Send Funds
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/scanner');
              },
              child: const Text('Send Funds'),
            ),

            // Whitespace
            const SizedBox(height: 15),

            // Receive Funds
            ElevatedButton(
              onPressed: () {
                generateQR(context);
              },
              child: const Text('Receive Funds'),
            ),

            // Whitespace
            const SizedBox(height: 15),

            // // Make Payment
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sendPeli');
              },
              child: const Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> generateQR(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              QrImage(
                data: _accountInfo.getWalletAddress(),
                version: QrVersions.auto,
                size: 300.0,
              ),

              // Total
              const Text(
                'SCAN ME',
                style: TextStyle(fontSize: 20),
              ),

              // Close Dialog
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'close',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
