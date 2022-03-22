import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // for this approach Flutter complain that has a value which is not finale and could be change in StatelessWidget
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitDate() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

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
              controller: _titleController,
              onSubmitted: (_) => _submitDate(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (value) => amountInput = value,
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitDate(),
            ),
            Container(
              height: 70,
              child: Row(children: <Widget>[
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No date chosen!'
                        : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}',
                  ),
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: _presentDatePicker,
                  child: Text(
                    'choose date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
            RaisedButton(
              child: Text('Add transaction'),
              color: Theme.of(context).primaryColor,
              // textColor: Theme.of(context).textTheme.button.color,
              textColor: Colors.white,
              onPressed: _submitDate,
              // onSubmitted: (_) => submitDate,
            )
          ],
        ),
      ),
    );
  }
}
