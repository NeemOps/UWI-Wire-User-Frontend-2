import 'package:flutter/material.dart';
import 'package:uwiwire_vendor/constants.dart';

import '../../models/transaction_model.dart';
import '../components/appbar/top_bar.dart';
import 'components/transaction_item.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionsList = TransactionModel.transactionsList();

    return Scaffold(
      appBar: TopBar.buildAppBar(context),
      body: Container(
        color: kPrimaryColor,
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: <Widget>[
            // Search
            buildSearchBox(context),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: const Text(
                          'Transactions',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      for (TransactionModel transaction in transactionsList)
                        TransactionItem(transaction: transaction),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildSearchBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 100,
      color: kPrimaryColor,
      child: FractionallySizedBox(
        heightFactor: 0.4,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
            ),
          ),
        ),
      ),
    );
  }
}
