import 'package:flutter/material.dart';
import './excercise_items_add_new.dart';
import 'excerciseCharts.dart';

class MediItemsTabBar extends StatefulWidget {
  static final routeName = '/medi-items-tab';

  @override
  _MediItemsTabBarState createState() => _MediItemsTabBarState();
}

class _MediItemsTabBarState extends State<MediItemsTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Excercise'),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.history,
                ),
                text: 'Past History',
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
            ExcerciseCharts(),
            MediItemsAddNew(),
          ],
        ),
      ),
    );
  }
}
