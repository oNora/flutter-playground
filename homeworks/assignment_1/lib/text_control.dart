import 'package:flutter/material.dart';

import './text_output.dart';

class TextControl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextControl();
}

class _TextControl extends State<TextControl> {
  String _mainText = 'first text';

  onBtnClick() {
    setState(() {
      _mainText = "new text";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextOutput(_mainText),
        RaisedButton(
          onPressed: onBtnClick,
          child: const Text('Change the text'),
        )
      ],
    );
  }
}
