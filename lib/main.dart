import 'package:flutter/material.dart';
import 'screens/food_items_tab_bar_screen.dart';
import 'screens/login_signup_screen.dart';
void main() => runApp(MyApp());

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
        });
  }
}

class MyHomePage extends StatelessWidget {
  void selectCatgory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      FoodItemsTabBar.routeName,
    );
  }

  bool loggedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Health App'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            loggedIn ? LoginSignupScreen: InkWell(
              onTap: () {
                selectCatgory(context);
              },
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Text("Food"),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.7),
                      Colors.blue,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
