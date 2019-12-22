import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'getRecommendations.dart';
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
        });
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  final TextStyle whiteText = TextStyle(color: Colors.white);
  void excercise(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MediItemsTabBar.routeName,
    );
  }

  void food(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      FoodItemsTabBar.routeName,
    );
  }

  void giveSuggestion(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GetRecommendations();
        });
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          _buildHeader(context),
          const SizedBox(height: 50.0),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 303,
                      color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "9,850",
                              style:
                                  Theme.of(context).textTheme.display1.copyWith(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                      ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.walking,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Steps',
                              style: whiteText,
                            ),
                          ),
                          Container(
                            height: 180,
                          ),
                          RaisedButton(
                            onPressed: () {
                              excercise(context);
                            },
                            child: Center(child: Text('Exercise')),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 300,
                      color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "2,430",
                              style:
                                  Theme.of(context).textTheme.display1.copyWith(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                      ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.fire,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Calories Burned',
                              style: whiteText,
                            ),
                          ),
                          Container(
                            height: 178,
                          ),
                          RaisedButton(
                            onPressed: () {
                              excercise(context);
                            },
                            child: Center(
                              child: Text('Exercise'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "2,930",
                              style:
                                  Theme.of(context).textTheme.display1.copyWith(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                            ),
                            Icon(
                              FontAwesomeIcons.fire,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      // padding: const EdgeInsets.only(left: 16.0),
                      // child:
                      FlatButton(
                        onPressed: () {
                          food(context);
                        },
                        child: Text(
                          'Calories Consumed',
                          style: whiteText,
                        ),
                      ),
                      // ),
                      FlatButton.icon(
                        label: Text(''),
                        color: Colors.green,
                        onPressed: () {
                          food(context);
                        },
                        icon: Icon(
                          Icons.fastfood,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                width: 328,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator(
            value: 0.5,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            backgroundColor: Colors.grey.shade700,
          ),
        ),
        const SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Today's\nProgress",
              style: whiteText.copyWith(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              "45% to go",
              style: TextStyle(color: Colors.grey, fontSize: 16.0),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "Today's Tips",
              style: TextStyle(color: Colors.grey.shade800),
            ),
            const SizedBox(height: 20.0),
            IconButton(
              alignment: Alignment.topRight,
              onPressed: () {
                giveSuggestion(context);
              },
              icon: Icon(
                Icons.fiber_new,
                color: Colors.white,
                size: 40,
              ),
            )
          ],
        ),
      ],
    );
  }
}
