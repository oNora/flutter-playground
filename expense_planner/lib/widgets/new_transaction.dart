import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // for this approach Flutter complain that has a value which is not finale and could be change in StatelessWidget
  // String titleInput;
  // String amountInput;

  // this approach can be used in StatelessWidget
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (value) => amountInput = value,
              controller: amountController,
            ),
            FlatButton(
              onPressed: () {
                // print(titleInput);
                // print(amountInput);
                // print(titleController.text);
                addTx(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: Text('Add transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
