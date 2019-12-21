import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<ExcerciseItems> fetchexcercise() async {
  final response = await http.get('https://a9b9ca5a.ngrok.io/home');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return ExcerciseItems.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load excercise results');
  }
}

class ExcerciseItems {
  final int excerciseId;
  final int profileId;
  final String excerciseName;
  final String date;
  final int caloriesBurnt;
  final int bmi;

  ExcerciseItems(
      {@required this.excerciseId,
      @required this.profileId,
      @required this.excerciseName,
      @required this.date,
      @required this.caloriesBurnt,
     this.bmi,
      });

  factory ExcerciseItems.fromJson(Map<String, dynamic> json) {
    return ExcerciseItems(
      excerciseId: json['exerciseId'],
      profileId: json['profileId'],
      excerciseName: json['exerciseName'],
      date: json['date'],
      caloriesBurnt: json['caloriesBurnt'],
      bmi: json['bmi'],
    );
  }
}
