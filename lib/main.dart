import 'package:flutter/material.dart';

import './categories.dart';
void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Categories(),
    );
  }
}