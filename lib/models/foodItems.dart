import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum MealTime {
  BREAKFAST,
  LUNCH,
  MIDTIME_SNACKS,
  EVENING_BREAKFAST,
  DINNER,
}

class FoodItems {
  final int foodId;
  final int profileId;
  final String foodName;
  final int calories;
  final int bmi;

  FoodItems({
    @required this.foodId,
    @required this.profileId,
    @required this.foodName,
    @required this.calories,
    @required this.bmi,
  });

  factory FoodItems.fromJson(Map<String, dynamic> json) {
    return FoodItems(
      foodId: json['foodId'],
      profileId: json['profileId'],
      foodName: json['foodName'],
      calories: json['calories'],
      bmi: json['bmi'],
    );
  }
}
