import 'package:flutter/material.dart';

import '../../../constants.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
  });

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
        leading: const Icon(Icons.circle),
        title: const Text('\$10,000'),
        subtitle: const Text('person'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Withdrawn'),

            // Whitespace
            SizedBox(height: 5),

            Text('Aug 19, 2019'),
          ],
        ),
      ),
    );
  }
}
