import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Transaction> transaction = [
      Transaction(
        id: 't1',
        title: 'new shoes',
        amount: 69.99,
        date: DateTime.now(),
      ),
      Transaction(
        id: 't2',
        title: 'weekly groceries',
        amount: 16.53,
        date: DateTime.now(),
      )
    ];

    // for this approach Flutter complain that has a value which is not finale and could be change in StatelessWidget
    // String titleInput;
    // String amountInput;

    // this approach can be used in StatelessWidget
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            Card(
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
                        print(titleController.text);
                      },
                      child: Text('Add transaction'),
                      textColor: Colors.purple,
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transaction.map((tx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${tx.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tx.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMMd().format(tx.date),
                            // DateFormat('dd-mm-yyyy').format(tx.date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ]),
    );
  }
}
