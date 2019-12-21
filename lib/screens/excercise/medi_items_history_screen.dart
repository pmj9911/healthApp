import 'package:flutter/material.dart';
import '../../models/Excerciseitems.dart';

class MediItemsScreen extends StatefulWidget {
  @override
  _MediItemsScreenState createState() => _MediItemsScreenState();
}

class _MediItemsScreenState extends State<MediItemsScreen> {
  Future<ExcerciseItems> excerciseItems;

  @override
  void initState() {
    super.initState();
    excerciseItems = fetchexcercise();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<ExcerciseItems>(
        future: excerciseItems,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 5,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 38,
                  child: FlatButton.icon(
                    label: Text(''),
                    icon: Icon(Icons.directions_run),
                    textColor: Colors.amber,
                    onPressed: () {},
                  ),
                ),
                title: Text(
                  snapshot.data.excerciseName,
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(snapshot.data.date),
                trailing: FlatButton.icon(
                  label: Text('${snapshot.data.caloriesBurnt.toString()} cal'),
                  icon: Icon(Icons.star),
                  textColor: Theme.of(context).errorColor,
                  onPressed: () {},
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
