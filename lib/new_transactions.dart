import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: "New Shoes", amount: 65.65, date: DateTime.now()),
    Transaction(
        id: 't2', title: "Monitor", amount: 79.86, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: transactions.map((e) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$${e.amount}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title: " + e.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      DateFormat().format(e.date),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
