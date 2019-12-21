import 'package:flutter/material.dart';
import './steps_items_history_screen.dart';
import './steps_items_add_new.dart';

class StepsItemsTabBar extends StatefulWidget {
    static final routeName = '/steps-items-tab';

  @override
  _StepsItemsTabBarState createState() => _StepsItemsTabBarState();
}

class _StepsItemsTabBarState extends State<StepsItemsTabBar> {
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
            StepsItemsScreen(),
            StepsItemsAddNew(),
          ],
        ),
      ),
    );
  }
}
