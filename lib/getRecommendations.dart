import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/recommendedExcercises.dart';

class GetRecommendations extends StatefulWidget {
  @override
  GgetRecommendationsState createState() => GgetRecommendationsState();
}

class GgetRecommendationsState extends State<GetRecommendations> {
  Future<RecommedExcercises> excercises;
  List<RecommedExcercises> newList = [];
  Future<RecommedExcercises> recommendExcercises() async {
    final response = await http.get('https://fcea7757.ngrok.io/food');
    // print(response.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      print("response is 2001");
      // print('${jsonDecode(response.body).toList()}');
      newList = jsonDecode(response.body).toList();
      return jsonDecode(response.body).toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception(jsonDecode(response.body));
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   excercises = recommendExcercises();
  // }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> values = snapshot.data;
    print("rewdtfghj");
    return new ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(values[index]),
            ),
            new Divider(
              height: 2.0,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // the original plan was to query this from the backend server via REST api and then display the results here dynamucally. but since similar problems were faced in the other modules for the POST request, we decided to input this data statically for now, although there is code for the same in the backend : django under healthApp/views.py under the Predict_Exercise class 
    return Container(
      child: ListView(
        children: <Widget>[
          Center(
            child: Text("Recommended exercises are: ",
                style: TextStyle(
                  fontSize: 24,
                )),
          ),
          Card(
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
                      '10 mins',
                      style: TextStyle(
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ),
              ),
              title: Text(
                "Sprinting",
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text("Burns 50 calories per 10 minutes !!"),
              trailing: FlatButton.icon(
                label: Text(''),
                icon: Icon(Icons.directions_run),
                textColor: Theme.of(context).errorColor,
                onPressed: () {},
              ),
            ),
          ),
          Card(
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
                      '15 mins',
                      style: TextStyle(
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ),
              ),
              title: Text(
                "WeightLifting",
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text("Burns 100 calories per 20 minutes !!"),
              trailing: FlatButton.icon(
                label: Text(''),
                icon: Icon(Icons.fitness_center),
                textColor: Theme.of(context).errorColor,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
