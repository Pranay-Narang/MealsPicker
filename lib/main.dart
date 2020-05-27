import 'package:flutter/material.dart';

import './meals.dart';
import './meal_details.dart';
import './tabs.dart';
import './filters.dart';
import './models/meal.dart';
import './dummy_data.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatefulWidget {
  @override
  _MealsAppState createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      availableMeals = DUMMY_MEALS.where((element) {
        if(filters['gluten'] && !element.isGlutenFree) {
          return false;
        }

        if(filters['lactose'] && !element.isLactoseFree) {
          return false;
        }

        if(filters['vegan'] && !element.isVegan) {
          return false;
        }

        if(filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

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
        '/category-meals': (ctx) => MealsScreen(availableMeals),
        '/meal-details': (ctx) => MealDetails(),
        '/filters': (ctx) => FiltersScreen(setFilters, filters),
      },
    );
  }
}
