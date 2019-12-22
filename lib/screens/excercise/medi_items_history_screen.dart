import 'package:flutter/material.dart';
import '../../models/Excerciseitems.dart';
import '../../models/foodItems.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MediItemsScreen extends StatefulWidget {
  @override
  _MediItemsScreenState createState() => _MediItemsScreenState();
}

class _MediItemsScreenState extends State<MediItemsScreen> {
  Future<ExcerciseItems> excerciseItems;
  List<ExcerciseItems> newList = [];

  Future<FoodItems> fetchfood() async {
    final response = await http.get('https://fcea7757.ngrok.io/exercise');
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

  @override
  void initState() {
    super.initState();
    excerciseItems = fetchexcercise();
  }

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
    return Container(
      child: FutureBuilder<ExcerciseItems>(
          future: excerciseItems,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return new Text('loading...');
              default:
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                else
                  return createListView(context, snapshot);
            }
          }),
    );
  }
}

//       child: FutureBuilder<ExcerciseItems>(
//         future: excerciseItems,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Card(
//               elevation: 5,
//               margin: EdgeInsets.symmetric(
//                 vertical: 8,
//                 horizontal: 5,
//               ),
//               child: ListView.builder(
//                 // itemCount: ,
//                 itemBuilder: (ctx, index) {
//                   return ListTile(
//                     leading: CircleAvatar(
//                       radius: 38,
//                       child: FlatButton.icon(
//                         label: Text(''),
//                         icon: Icon(Icons.directions_run),
//                         textColor: Colors.amber,
//                         onPressed: () {},
//                       ),
//                     ),
//                     title: Text(
//                       snapshot.data.excerciseName,
//                       style: Theme.of(context).textTheme.title,
//                     ),
//                     subtitle: Text(snapshot.data.date),
//                     trailing: FlatButton.icon(
//                       label:
//                           Text('${snapshot.data.caloriesBurnt.toString()} cal'),
//                       icon: Icon(Icons.star),
//                       textColor: Theme.of(context).errorColor,
//                       onPressed: () {},
//                     ),
//                   );
//                 },
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Text("${snapshot.error}");
//           }

//           // By default, show a loading spinner.
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }
