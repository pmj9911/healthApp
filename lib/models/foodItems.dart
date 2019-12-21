import 'package:flutter/material.dart';

class FoodItems {
  final int id;
    final String name;
    final String type;
    final double calories;
    final DateTime lastConsumed;

  FoodItems({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.calories,
    @required this.lastConsumed,
  });
}
