import 'package:flutter/material.dart';
// import 'package:uwiwire_vendor/oop/_account_info.dart';
import 'package:uwiwire_vendor/constants.dart';

class HeaderWithBalance extends StatelessWidget {
  const HeaderWithBalance({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    // Get Account Balance
    // AccountInfo acc = AccountInfo(balance: 0, email: '', name: '');
    // var bal = acc.getBalance();

    return Container(
      //
      height: size.height * 0.15,
      color: kPrimaryColor,
      //
      child: Stack(
        children: <Widget>[
          Container(
            //
            height: size.height * 0.15 - 27,
            width: size.width,
            decoration: const BoxDecoration(color: Colors.purple),
            //
            // Displays the balance at the top of the body
            child: Column(
              children: <Widget>[
                Text(
                  'Balance',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                // Text('$bal'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
