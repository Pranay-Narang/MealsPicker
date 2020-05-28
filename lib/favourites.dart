import 'package:flutter/material.dart';

import './models/meal.dart';

import './meal_items.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favouriteMeals;

  Favourites(this.favouriteMeals);

  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('Favourites Screen'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, scrollIndex) {
          return MealItems(
            id: favouriteMeals[scrollIndex].id,
            title: favouriteMeals[scrollIndex].title,
            imageUrl: favouriteMeals[scrollIndex].imageUrl,
            duration: favouriteMeals[scrollIndex].duration,
            complexity: favouriteMeals[scrollIndex].complexity,
            affordability: favouriteMeals[scrollIndex].affordability,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
