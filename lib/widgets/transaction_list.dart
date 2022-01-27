import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

import 'TransactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteCallback;
  TransactionList(this.transactions, this.deleteCallback);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constrains) {
            return Column(
              children: [
                Container(
                  height: constrains.maxHeight * 0.10,
                  child: Text(
                    'There is no transaction added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(
                  height: constrains.maxHeight * 0.05,
                ),
                Container(
                  height: constrains.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView(
            children: [
              ...transactions
                  .map(
                    (e) => TransactionItem(
                        key: ValueKey(e.id),
                        transaction: e,
                        deleteCallback: deleteCallback),
                  )
                  .toList(),
            ],
          );
  }
}
