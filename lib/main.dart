import 'package:flutter/material.dart';

import './meals.dart';
import './meal_details.dart';
import './tabs.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
            ),
      ),
      home: TabsScreen(),
      routes: {
        '/category-meals': (ctx) => MealsScreen(),
        '/meal-details': (ctx) => MealDetails(),
      },
    );
  }
}
