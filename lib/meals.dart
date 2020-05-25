import 'package:flutter/material.dart';

import './dummy_data.dart';
import './meal_items.dart';

class MealsScreen extends StatelessWidget {
//  final String categoryId;
//  final String categoryTitle;

//  MealsScreen(this.categoryId, this.categoryTitle);

  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, scrollIndex) {
          return MealItems(
            id: categoryMeals[scrollIndex].id,
            title: categoryMeals[scrollIndex].title,
            imageUrl: categoryMeals[scrollIndex].imageUrl,
            duration: categoryMeals[scrollIndex].duration,
            complexity: categoryMeals[scrollIndex].complexity,
            affordability: categoryMeals[scrollIndex].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
