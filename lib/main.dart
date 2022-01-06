import 'package:flutter/material.dart';
import 'transaction.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: "New Shoes", amount: 65.5, date: DateTime.now()),
    Transaction(
        id: 't2', title: "Monitor", amount: 79.86, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              //width: double.infinity,
              child: Card(
                color: Colors.orange,
                child: Text("Chart!"),
                elevation: 5,
              ),
            ),
            Column(
              children: transactions.map((e) {
                return Card(
                  child: Text(e.title),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
