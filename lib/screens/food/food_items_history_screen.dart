import 'package:flutter/material.dart';
import '../../models/foodItems.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class FoodItemsScreen extends StatefulWidget {
  @override
  _FoodItemsScreenState createState() => _FoodItemsScreenState();
}

class _FoodItemsScreenState extends State<FoodItemsScreen> {
  Future<FoodItems> foodItems;
 List<FoodItems> newList=[];
Future<FoodItems> fetchfood() async {
  final response = await http.get('https://fcea7757.ngrok.io/food');
  // print(response.toString());
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    print("response is 2001");
    print('${jsonDecode(response.body).toList()}');
    newList  = jsonDecode(response.body).toList();
    return jsonDecode(response.body).toList();
  } else {
    // If that call was not successful, throw an error.
    throw Exception(jsonDecode(response.body));
  }
}
  @override
  void initState() {
    super.initState();
    foodItems = fetchfood();
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> values = snapshot.data;
    print(values.toList());
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
    return Container(
      child: FutureBuilder<FoodItems>(
          future: foodItems,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return new Text('loading...');
              default:
                // if (snapshot.hasError)
                  // return new Text('Error: ${snapshot.error}');
                // else
                  return createListView(context, snapshot);
            }
          }),
    );
  }
}
