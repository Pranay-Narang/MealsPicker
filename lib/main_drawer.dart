import 'package:flutter/material.dart';

import './tabs.dart';

import './models/meal.dart';

class MainDrawer extends StatelessWidget {
  final List<Meal> favouriteMeals;

  MainDrawer(this.favouriteMeals);

  Widget buildListTile(String text, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Experimentation',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 5),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () => Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) => TabsScreen(favouriteMeals))),
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () => Navigator.of(context).pushReplacementNamed('/filters'),
          ),
        ],
      ),
    );
  }
}
