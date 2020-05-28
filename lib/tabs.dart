import 'package:flutter/material.dart';

import './categories.dart';
import './favourites.dart';
import './main_drawer.dart';

import './models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  State<StatefulWidget> createState() {
    return TabsScreenState();
  }
}

class TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;

  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    pages = [
      {
        'page': Categories(),
        'title': 'Categories',
      },
      {
        'page': Favourites(widget.favouriteMeals),
        'title': 'Favourites',
      },
    ];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(widget.favouriteMeals),
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourites'),
          )
        ],
      ),
    );
  }
}
