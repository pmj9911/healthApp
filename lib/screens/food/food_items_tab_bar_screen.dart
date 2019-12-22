import 'package:flutter/material.dart';
import './food_items_add_new.dart';
import 'dart:io';

import 'foodsLists.dart';

class FoodItemsTabBar extends StatefulWidget {
  static final routeName = '/food-items-tab';

  @override
  _FoodItemsTabBarState createState() => _FoodItemsTabBarState();
}

class _FoodItemsTabBarState extends State<FoodItemsTabBar> {
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Meals'),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.history,
                ),
                text: 'History',
              ),
              Tab(
                icon: Icon(
                  Icons.add,
                ),
                text: 'Add New',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FoodsLists(),
            FoodItemsAddNew(_selectImage),
          ],
        ),
      ),
    );
  }
}
