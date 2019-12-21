import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/foodItems.dart';

class FoodItemsScreen extends StatefulWidget {
  @override
  _FoodItemsScreenState createState() => _FoodItemsScreenState();
}

class _FoodItemsScreenState extends State<FoodItemsScreen> {
  final List<FoodItems> foodItems = [
    FoodItems(
      id: 1,
      name: "abc",
      type: "def",
      calories: 140.0,
      lastConsumed: DateTime.now(),
      mealTime: MealTime.BREAKFAST,
    ),
    FoodItems(
      id: 2,
      name: "qwe",
      type: "rty",
      calories: 240.0,
      lastConsumed: DateTime.now().subtract(
        Duration(
          days: 1,
        ),
      ),
      mealTime: MealTime.DINNER,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
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
                    '${foodItems[index].calories} Kcal${foodItems[index].mealTime},',
                    style: TextStyle(
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              foodItems[index].name,
              style: Theme.of(context).textTheme.title,
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(foodItems[index].lastConsumed),
            ),
            // trailing: MediaQuery.of(context).size.width > 400
            //     ? FlatButton.icon(
            //         label: Text('Delete'),
            //         icon: Icon(Icons.delete),
            //         textColor: Theme.of(context).errorColor,
            //         onPressed: () {
            //           deleteTransaction(foodItems[index].id);
            //         },
            //       )
            //     : IconButton(
            //         icon: Icon(Icons.delete),
            //         color: Theme.of(context).errorColor,
            //         onPressed: () {
            //           deleteTransaction(foodItems[index].id);
            //         },
            //       ),
          ),
        );
      },
      itemCount: foodItems.length,
    );
  }
}
