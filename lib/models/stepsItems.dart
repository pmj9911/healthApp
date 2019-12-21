import 'package:flutter/material.dart';

class StepsItems {
  final int id;
    final String name;
    final String type;
    final double calories;
    final DateTime lastConsumed;

  StepsItems({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.calories,
    @required this.lastConsumed,
  });
}
