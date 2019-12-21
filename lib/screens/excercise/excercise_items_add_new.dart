import 'package:flutter/material.dart';
import '../../models/excerciseitems.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MediItemsAddNew extends StatefulWidget {
  @override
  _MediItemsAddNewState createState() => _MediItemsAddNewState();
}

class _MediItemsAddNewState extends State<MediItemsAddNew> {
  ExcerciseItems newProduct;
  void addNewExcercise(ExcerciseItems excerciseItems) {
    const url = 'https://flutter-update.firebaseio.com/products.json';
    http
        .post(
      url,
      body: json.encode({
        'excerciseId': excerciseItems.excerciseId,
        'profileId': excerciseItems.profileId,
        'excerciseName': excerciseItems.excerciseName,
        'date': excerciseItems.date,
        'caloriesBurnt': excerciseItems.caloriesBurnt,
      }),
    )
        .then((response) {
      newProduct = ExcerciseItems(
        excerciseId: excerciseItems.excerciseId,
        profileId: excerciseItems.profileId,
        excerciseName: excerciseItems.excerciseName,
        date: excerciseItems.date,
        caloriesBurnt: excerciseItems.caloriesBurnt,
      );
      // _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      // notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('hello'));
  }
}
