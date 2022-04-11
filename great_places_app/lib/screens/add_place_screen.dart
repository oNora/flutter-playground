import 'package:flutter/material.dart';

import '../widget/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';
  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        controller: _titleController,
                      ),
                      SizedBox(height: 10),
                      ImageInput(),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Add Place'),
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  primary: Theme.of(context).accentColor,
                  onPrimary: Colors.black),
            )
          ]),
    );
  }
}
