import 'package:flutter/material.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meals App"),
      ),
    );
  }
}