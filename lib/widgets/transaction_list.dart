import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

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
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          textColor: Theme.of(context).errorColor,
                          onPressed: () =>
                              deleteCallback(transactions[index].id),
                          icon: Icon(Icons.delete),
                          label: Text("Delete"))
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () =>
                              deleteCallback(transactions[index].id),
                        ),
                ),
              );
            },
          );
  }
}
