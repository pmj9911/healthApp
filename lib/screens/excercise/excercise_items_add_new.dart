import 'package:flutter/material.dart';
import '../../models/excerciseitems.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MediItemsAddNew extends StatefulWidget {
  @override
  _MediItemsAddNewState createState() => _MediItemsAddNewState();
}

class _MediItemsAddNewState extends State<MediItemsAddNew> {
  var temp = ExcerciseItems(
    excerciseId: 0,
    profileId: 0,
    excerciseName: '',
    date: '',
    duration: 0,
    caloriesBurnt: 0,
  );
  final _excerciseIdFocusNode = FocusNode();
  final durationFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    _excerciseIdFocusNode.dispose();
    durationFocusNode.dispose();
    super.dispose();
  }

  bool uploaded = false;
  void addNewExcercise() {
    //ExcerciseItems excerciseItems) {
    const url = 'https://fcea7757.ngrok.io/exercise';
    http
        .post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: json.encode(
        {
          'excerciseId': temp.excerciseId,
          // 'profileId': temp.profileId,
          // 'excerciseName': temp.excerciseName,
          // 'date': temp.date,
          'caloriesBurnt': 343, //excerciseItems.caloriesBurnt,
          'duration': temp.duration,
        },
      ),
      encoding: Encoding.getByName("utf-8"),
    )
        .then((response) {
      // newProduct = ExcerciseItems(
      //   excerciseId: excerciseItems.excerciseId,
      //   profileId: excerciseItems.profileId,
      //   excerciseName: excerciseItems.excerciseName,
      //   date: excerciseItems.date,
      //   caloriesBurnt: excerciseItems.caloriesBurnt,
      print('successfull');
      uploaded = true;
      // );
      // _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      // notifyListeners();
    });
    // return
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      // print(duration);
      // print(excerciseId);
      print("invalid");
      return;
    }
    // print(duration);
    // print(excerciseId);
    _form.currentState.save();

    print(temp.excerciseId);
    print(temp.duration);
    print("valid");
    _form.currentState.save();
    addNewExcercise();
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            uploaded
                ? Center(
                    child: Text(
                    "the records have been updated",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ))
                : Text(''),
            TextFormField(
              decoration: InputDecoration(labelText: 'excercise id'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              focusNode: _excerciseIdFocusNode,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(durationFocusNode);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter excercise id.';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid number.';
                }
                if (double.parse(value) <= 0) {
                  return 'Please enter a number greater than zero.';
                }
                return null;
              },
              onSaved: (value) {
                temp = ExcerciseItems(
                  excerciseId: int.parse(value),
                  profileId: temp.profileId,
                  excerciseName: temp.excerciseName,
                  date: temp.date,
                  duration: temp.duration,
                  caloriesBurnt: 0,
                );
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Duration (in mins) '),
              maxLines: 3,
              keyboardType: TextInputType.number,
              focusNode: durationFocusNode,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a price.';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid number.';
                }
                if (double.parse(value) <= 0) {
                  return 'Please enter a number greater than zero.';
                }
                return null;
              },
              onSaved: (value) {
                temp = ExcerciseItems(
                  excerciseId: temp.excerciseId,
                  profileId: temp.profileId,
                  excerciseName: temp.excerciseName,
                  date: temp.date,
                  duration: int.parse(value),
                  caloriesBurnt: 0,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.save),
              onPressed: _saveForm,
            ),
          ],
        ),
      ),
    );
  }
}
