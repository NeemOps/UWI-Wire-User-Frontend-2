import 'package:flutter/material.dart';
import 'package:uwiwire_vendor/backend/transactions/_transactions.dart';
import 'package:uwiwire_vendor/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SendPeliScreen extends StatefulWidget {
  final dynamic walletAddr;

  const SendPeliScreen({super.key, required this.walletAddr});

  @override
  State<SendPeliScreen> createState() =>
      // ignore: no_logic_in_create_state
      _SendPeliScreenState(recipient: walletAddr);
}

class _SendPeliScreenState extends State<SendPeliScreen> {
  dynamic recipient;

  _SendPeliScreenState({required this.recipient});

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
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Whitespace
              const SizedBox(height: 32.0),

              // Recipient name and address
              Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recipient',
                      style: TextStyle(color: kPrimaryColor, fontSize: 30),
                    ),
                    Text('Name: '),
                    Text('Wallet Address: $recipient'),
                  ],
                ),
              ),

              Text(
                'Amount: \$${_total.toStringAsFixed(2)}',
                style: const TextStyle(color: kPrimaryColor, fontSize: 30),
                textAlign: TextAlign.center,
              ),

              // Whitespace
              const SizedBox(height: 32.0),

              // Enter amount
              Container(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _subtotalController,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
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

                    // Whitespace
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

                    // Whitespace
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

                    // Send
                    ElevatedButton(
                      onPressed: () async {
                        Transactions transactions = Transactions();
                        try {
                          await transactions.sendTokens(recipient, _total);
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const Text('Send'),
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

  Widget _buildCalcButton(String text) {
    return ElevatedButton(
      onPressed: () {
        _subtotalController.text += text;
      },
      child: Text(text),
    );
  }
}
