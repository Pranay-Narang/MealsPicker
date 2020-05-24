import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  MealsScreen(this.categoryId, this.categoryTitle);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text("Recipes Here"),
      ),
    );
  }
}
