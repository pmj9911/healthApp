import 'package:flutter/material.dart';
import 'package:healthapp/categories.dart';
import 'package:healthapp/profile.dart';

import 'screens/food/food_items_tab_bar_screen.dart';
import 'screens/excercise/medi_items_tab_bar_screen.dart';
import 'screens/step/steps_items_tab_bar_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        routes: {
          FoodItemsTabBar.routeName: (ctx) => FoodItemsTabBar(),
          MediItemsTabBar.routeName: (ctx) => MediItemsTabBar(),
          StepsItemsTabBar.routeName: (ctx) => StepsItemsTabBar(),
        });
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Health App'),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        // initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.info_outline),
                  text: 'Profile',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Categories(),
              Profile(),
            ],
          ),
        ),
      ),
    );
  }
}

//   Container(
//     padding: EdgeInsets.all(10),
//     margin: EdgeInsets.all(20),
//     width: double.infinity,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Column(
//           children: <Widget>[
//             InkWell(
//               onTap: () {
//                 selectCatgoryFood(context);
//               },
//               splashColor: Theme.of(context).primaryColor,
//               borderRadius: BorderRadius.circular(15),
//               child: containerAll('Food'),
//             ),
//             InkWell(
//               onTap: () {
//                 selectCatgoryWater(context);
//               },
//               splashColor: Theme.of(context).primaryColor,
//               borderRadius: BorderRadius.circular(15),
//               child: containerAll('Water'),
//             ),
//             InkWell(
//               onTap: () {
//                 selectCatgorySleep(context);
//               },
//               splashColor: Theme.of(context).primaryColor,
//               borderRadius: BorderRadius.circular(15),
//               child: containerAll('Sleep'),
//             ),
//             InkWell(
//               onTap: () {
//                 selectCatgoryMedi(context);
//               },
//               splashColor: Theme.of(context).primaryColor,
//               borderRadius: BorderRadius.circular(15),
//               child: containerAll('Medicine'),
//             ),
//             InkWell(
//               onTap: () {
//                 selectCatgorySteps(context);
//               },
//               splashColor: Theme.of(context).primaryColor,
//               borderRadius: BorderRadius.circular(15),
//               child: containerAll('Steps'),
//             ),
//           ],
//         ),
//         Column(
//           children: <Widget>[
//             InkWell(
//               onTap: () {
//                 selectCatgoryFood(context);
//               },
//               splashColor: Theme.of(context).primaryColor,
//               borderRadius: BorderRadius.circular(15),
//               child: containerAll('Food'),
//             ),
//             InkWell(
//               onTap: () {
//                 selectCatgoryWater(context);
//               },
//               splashColor: Theme.of(context).primaryColor,
//               borderRadius: BorderRadius.circular(15),
//               child: containerAll('Water'),
//             ),
//             InkWell(
//               onTap: () {
//                 selectCatgorySleep(context);
//               },
//               splashColor: Theme.of(context).primaryColor,
//               borderRadius: BorderRadius.circular(15),
//               child: containerAll('Sleep'),
//             ),
//             InkWell(
//               onTap: () {
//                 selectCatgoryMedi(context);
//               },
//               splashColor: Theme.of(context).primaryColor,
//               borderRadius: BorderRadius.circular(15),
//               child: containerAll('Medicine'),
//             ),
//             InkWell(
//               onTap: () {
//                 selectCatgorySteps(context);
//               },
//               splashColor: Theme.of(context).primaryColor,
//               borderRadius: BorderRadius.circular(15),
//               child: containerAll('Steps'),
//             ),
//           ],
//         ),
//       ],
//     ),
//   ),
