import 'package:flutter/material.dart';
import 'new_transactions.dart';
import 'transaction.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          NewTransactions(),
        ],
      ),
    );
  }
}
