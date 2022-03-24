import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routName = '/mela-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('${mealId}')),
      body: Container(
        child: Text('the meal! ${mealId}'),
      ),
    );
  }
}
