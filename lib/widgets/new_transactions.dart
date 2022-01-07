import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  Function userCallBackFunction;
  NewTransaction(this.userCallBackFunction);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _SubmitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (amountController.text.isEmpty || enteredTitle.isEmpty) return;

    userCallBackFunction(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => _SubmitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _SubmitData(),
            ),
            FlatButton(
              onPressed: _SubmitData,
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
