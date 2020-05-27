import 'package:flutter/material.dart';

import './main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFree = false;
  var vegetarian = false;
  var vegan = false;
  var lactoseFree = false;

  Widget buildSwitchListTile(
      String title, String subtitle, bool currentVal, Function updateVal) {
    return SwitchListTile(
      title: Text(title),
      value: currentVal,
      subtitle: Text(subtitle),
      onChanged: updateVal,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  'Gluten Free',
                  'Include only "Gluten Free" meals',
                  glutenFree,
                  (newVal) {
                    setState(() {
                      glutenFree = newVal;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactose Free',
                  'Include only "Lactose Free" meals',
                  lactoseFree,
                  (newVal) {
                    setState(() {
                      lactoseFree = newVal;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  'Include only vegetarian meals',
                  vegetarian,
                  (newVal) {
                    setState(() {
                      vegetarian = newVal;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                  vegan,
                  (newVal) {
                    setState(() {
                      vegan = newVal;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
