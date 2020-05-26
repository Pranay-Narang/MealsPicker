import 'package:flutter/material.dart';

import './categories.dart';
import './favourites.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabsScreenState();
  }
}

class TabsScreenState extends State<TabsScreen> {
  final List<Widget> pages = [
    Categories(),
    Favourites(),
  ];

  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      body: pages[selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
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
