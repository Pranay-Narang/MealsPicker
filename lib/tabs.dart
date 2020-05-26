import 'package:flutter/material.dart';
import 'package:meals_app/favourites.dart';

import './categories.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabsScreenState();
  }
}

class TabsScreenState extends State<TabsScreen> {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favouites',
              )
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          Categories(),
          Favourites(),
        ]),
      ),
    );
  }
}
