import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  final mainText;

  TextOutput(this.mainText);

  @override
  Widget build(BuildContext context) {
    return Text(
      mainText,
      style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    );
  }
}
