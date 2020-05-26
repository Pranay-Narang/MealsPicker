import 'package:flutter/material.dart';

import './main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Center(
        child: Text('Filters Man'),
      ),
      drawer: MainDrawer(),
    );
  }
}
