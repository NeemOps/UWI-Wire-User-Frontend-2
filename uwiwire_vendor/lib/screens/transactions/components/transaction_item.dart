import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/transaction_model.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(20),
        color: kGrey,
      ),
      child: ListTile(
        onTap: () {},
        leading: (!transaction.isReceiver! && transaction.isPurchase!)
            ? const Icon(Icons.circle, color: Colors.red)
            : (!transaction.isReceiver! && !transaction.isPurchase!)
                ? const Icon(Icons.circle, color: Colors.blue)
                : (transaction.isReceiver! && !transaction.isPurchase!)
                    ? const Icon(Icons.circle, color: Colors.green)
                    : const Icon(Icons.circle, color: Colors.black),
        title: Text('\$${transaction.amount!.toStringAsFixed(2)}'),
        subtitle: (!transaction.isReceiver! && transaction.isPurchase!)
            ? Text(transaction.receiver!)
            : (!transaction.isReceiver! && !transaction.isPurchase!)
                ? Text(transaction.receiver!)
                : (transaction.isReceiver! && !transaction.isPurchase!)
                    ? Text(transaction.sender!)
                    : const Text('Person'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (!transaction.isReceiver! && transaction.isPurchase!)
                ? const Text(
                    'Purchase',
                    style: TextStyle(color: Colors.red),
                  )
                : (!transaction.isReceiver! && !transaction.isPurchase!)
                    ? const Text(
                        'Sent',
                        style: TextStyle(color: Colors.blue),
                      )
                    : (transaction.isReceiver! && !transaction.isPurchase!)
                        ? const Text(
                            'Deposited',
                            style: TextStyle(color: Colors.green),
                          )
                        : const Text(
                            'Transaction',
                            style: TextStyle(color: Colors.black),
                          ),

            // Whitespace
            const SizedBox(height: 5),

            const Text('Aug 19, 2019'),
          ],
        ),
      ),
    );
  }
}
