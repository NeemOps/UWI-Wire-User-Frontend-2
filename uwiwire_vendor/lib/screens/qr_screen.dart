import 'package:flutter/material.dart';
import 'package:uwiwire_vendor/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRPage extends StatefulWidget {
  const GenerateQRPage({super.key});

  @override
  State<GenerateQRPage> createState() => _GenerateQRPageState();
}

class _GenerateQRPageState extends State<GenerateQRPage> {
  final TextEditingController _subtotalController = TextEditingController();
  double _total = 0.0;

  @override
  void initState() {
    super.initState();
    _subtotalController.addListener(() {
      setState(() {
        _total = double.tryParse(_subtotalController.text) ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _subtotalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // Whitespace
              const SizedBox(height: 32.0),

              // Displays Total
              Text(
                'Total: \$${_total.toStringAsFixed(2)}',
                style: const TextStyle(color: kPrimaryColor, fontSize: 30),
                textAlign: TextAlign.center,
              ),

              // Whitespace
              const SizedBox(height: 32.0),

              // Subtotal
              Container(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _subtotalController,
                  decoration: const InputDecoration(
                    labelText: 'Subtotal',
                    prefixText: '\$',
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),

              // Whitespace
              const SizedBox(height: 16.0),

              // Number pad
              Container(
                height: 500,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    // Whitespace
                    const SizedBox(height: 32.0),
                    // 1, 2, 3
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCalcButton('1'),
                        _buildCalcButton('2'),
                        _buildCalcButton('3'),
                      ],
                    ),
                    const SizedBox(height: 16.0),

                    // 4, 5, 6
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCalcButton('4'),
                        _buildCalcButton('5'),
                        _buildCalcButton('6'),
                      ],
                    ),
                    const SizedBox(height: 16.0),

                    // 7, 8, 9
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCalcButton('7'),
                        _buildCalcButton('8'),
                        _buildCalcButton('9'),
                      ],
                    ),

                    // Whitespace
                    const SizedBox(height: 16.0),

                    // ., 0, clear
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCalcButton('.'),
                        _buildCalcButton('0'),
                        ElevatedButton(
                          onPressed: () {
                            _subtotalController.clear();
                            setState(() {
                              _total = 0.0;
                            });
                          },
                          child: const Text('Clear'),
                        ),
                      ],
                    ),

                    // Whitespace
                    const SizedBox(height: 16.0),

                    // Generate QR Code
                    ElevatedButton(
                      onPressed: () {
                        generateQR(context);
                      },
                      child: const Text('Generate QR'),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                data: _total.toStringAsFixed(2),
                version: QrVersions.auto,
                size: 300.0,
              ),

              // Total
              Text(
                'Total: \$${_total.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                // Close Dialog
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

  Widget _buildCalcButton(String text) {
    return ElevatedButton(
      onPressed: () {
        _subtotalController.text += text;
      },
      child: Text(text),
    );
  }
}
