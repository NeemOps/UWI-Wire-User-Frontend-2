import 'package:flutter/material.dart';
import 'package:uwiwire_vendor/constants.dart';

import '../../../backend/_account_info.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});

  final AccountInfo _accountInfo = AccountInfo();

  @override
  Widget build(BuildContext context) {
    // Total width and height of screen
    Size size = MediaQuery.of(context).size;

    return Container(
      color: kPrimaryColor,

      child: Column(
        children: [
          // Balance
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            width: size.width,
            decoration: const BoxDecoration(color: kPrimaryColor),
            child: Column(
              children: [
                const Text(
                  'Balance',
                  style: TextStyle(color: kBackgroundColor, fontSize: 30),
                ),
                Text(
                  '\$${_accountInfo.getBalance()}',
                  style: const TextStyle(color: kBackgroundColor, fontSize: 50),
                ),
              ],
            ),
          ),

          // Transactions
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
      // child: Column(
      //   children: <Widget>[
      //     HeaderWithBalance(size: size),
      //     SizedBox(
      //       // Container height and width
      //       height: size.height * 0.6,
      //       width: size.width,

      //       child: Stack(
      //         children: <Widget>[
      //           // Decoration
      //           Container(
      //             decoration: const BoxDecoration(
      //               color: kBackgroundColor,
      //               borderRadius: BorderRadius.only(
      //                 topLeft: Radius.circular(30),
      //                 topRight: Radius.circular(30),
      //               ),
      //             ),
      //           ),
      //           Positioned(
      //             top: 100,
      //             left: 0,
      //             right: 0,
      //             child: Container(
      //               height: 35,
      //               decoration: const BoxDecoration(
      //                 color: kGrey,
      //               ),
      //               child: const Text('Latest Transactions'),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
