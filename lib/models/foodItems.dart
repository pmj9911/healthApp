import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum MealTime{
  BREAKFAST,
  LUNCH,
  MIDTIME_SNACKS,
  EVENING_BREAKFAST,
  DINNER,
}

class FoodItems {
  final int id;
    final String name;
    final String type;
    final double calories;
    final DateTime lastConsumed;
    final MealTime mealTime;    

  FoodItems({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.calories,
    @required this.lastConsumed,
    @required this.mealTime,
  });
  Future<void> fetchPost() async {
    try {
      const url = 'https://a9b9ca5a.ngrok.io/home';
      final response = await http.get(url);
      print(response.body);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);
      // notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
