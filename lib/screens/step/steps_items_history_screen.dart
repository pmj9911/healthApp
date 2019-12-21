import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/stepsItems.dart';

class StepsItemsScreen extends StatefulWidget {
  @override
  _StepsItemsScreenState createState() => _StepsItemsScreenState();
}

class _StepsItemsScreenState extends State<StepsItemsScreen> {
  final List<StepsItems>stepsItems = [
   StepsItems(
      id: 1,
      name: "abc",
      type: "def",
      calories: 140.0,
      lastConsumed: DateTime.now(),
    ),
   StepsItems(
      id: 2,
      name: "qwe",
      type: "rty",
      calories: 240.0,
      lastConsumed: DateTime.now().subtract(
        Duration(
          days: 1,
        ),
      ),
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
                    '${stepsItems[index].calories} Kcal',
                    style: TextStyle(
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
             stepsItems[index].name,
              style: Theme.of(context).textTheme.title,
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(stepsItems[index].lastConsumed),
            ),
            // trailing: MediaQuery.of(context).size.width > 400
            //     ? FlatButton.icon(
            //         label: Text('Delete'),
            //         icon: Icon(Icons.delete),
            //         textColor: Theme.of(context).errorColor,
            //         onPressed: () {
            //           deleteTransaction(waterItems[index].id);
            //         },
            //       )
            //     : IconButton(
            //         icon: Icon(Icons.delete),
            //         color: Theme.of(context).errorColor,
            //         onPressed: () {
            //           deleteTransaction(waterItems[index].id);
            //         },
            //       ),
          ),
        );
      },
      itemCount:stepsItems.length,
    );
  }
}
