import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<RecommedExcercises> recommendExcercises() async {
  final response = await http.get('https://fcea7757.ngrok.io/exercise');
  print('QQQQQQQQQQQQQQQQQQQQ ${response.toString()} QQQQQQQQQQQQQQQQQQQQQQQQQQQQQqqq');
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    print(json.decode(response.body));
    return RecommedExcercises.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('${json.decode(response.body)} \n lalalalalal');
  }
}

class RecommedExcercises {
  final int excerciseId;
  final int profileId;
  final String excerciseName;
  final String date;
  final int caloriesBurnt;
  final int bmi;
  final int duration;

  RecommedExcercises({
    this.excerciseId,
    this.profileId,
    @required this.excerciseName,
    this.date,
    this.caloriesBurnt,
    this.bmi,
    this.duration,
  });

  factory RecommedExcercises.fromJson(Map<String, dynamic> json) {
    return RecommedExcercises(
      // excerciseId: json['exerciseId'],
      // profileId: json['profileId'],
      excerciseName: json['exerciseName'],
      // date: json['date'],
      // caloriesBurnt: json['caloriesBurnt'],
      // bmi: json['bmi'],
    );
  }
}
