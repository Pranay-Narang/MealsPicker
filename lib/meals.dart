import 'package:flutter/material.dart';

import './dummy_data.dart';
import './meal_items.dart';
import './models/meal.dart';

class MealsScreen extends StatefulWidget {
//  final String categoryId;
//  final String categoryTitle;

//  MealsScreen(this.categoryId, this.categoryTitle);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];

      displayedMeals = DUMMY_MEALS.where((element) {
        return element.categories.contains(categoryId);
      }).toList();
      loadedInitData = true;
      super.didChangeDependencies();
    }
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, scrollIndex) {
          return MealItems(
            id: displayedMeals[scrollIndex].id,
            title: displayedMeals[scrollIndex].title,
            imageUrl: displayedMeals[scrollIndex].imageUrl,
            duration: displayedMeals[scrollIndex].duration,
            complexity: displayedMeals[scrollIndex].complexity,
            affordability: displayedMeals[scrollIndex].affordability,
            removeItem: removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
