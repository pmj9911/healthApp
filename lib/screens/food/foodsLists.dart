import 'package:flutter/material.dart';

import 'food_items_history_screen.dart';

class FoodsLists extends StatefulWidget {
  @override
  _FoodsListsState createState() => _FoodsListsState();
}

Widget cards(String title, String calories) {
  return Container(
    height: 100,
    padding: EdgeInsets.only(top:10),
    child: Card(
      elevation: 5,
      
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            
            child: FittedBox(
              child: Text(
                '${calories} Kcal',
                style: TextStyle(
                  color: Colors.yellow,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          title,
          // style: Theme.of(context).textTheme.title,
        ),
      ),
    ),
  );
}

class _FoodsListsState extends State<FoodsLists> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                cards("Pav Bhaji", "200"),
                cards("Vada Pav", "290"),
                cards("Paneer Masala", "367"),
              ],
            ),
          ),
          // FoodItemsScreen(), // fetches all the current exercise results from the django server but problems were faced in the future module of flutter, thus this mdule has been commented out
        ],
      ),
    );
  }
}
