import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:flutter_sparkline/flutter_sparkline.dart';

class ExcerciseCharts extends StatefulWidget {
  @override
  ExcerciseChartsState createState() => ExcerciseChartsState();
}

class ExcerciseChartsState extends State<ExcerciseCharts> {
  math.Random random = new math.Random();

  List<double> _generateRandomData(int count) {
    List<double> result = <double>[];
    for (int i = 0; i < count; i++) {
      result.add(random.nextDouble() * 100);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var data = _generateRandomData(7);
    var data2 = _generateRandomData(30);

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            width: 300.0,
            // height: 250.0,
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  child: new Sparkline(
                    data: data,
                    fillMode: FillMode.below,
                    fillGradient: new LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.red[800], Colors.red[200]],
                    ),
                  ),
                ),
                Center(
                  child: Text("Records of past 7 days"),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            height: 250.0,
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  child: new Sparkline(
                    data: data2,
                    fillMode: FillMode.below,
                    fillGradient: new LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.red[800], Colors.red[200]],
                    ),
                  ),
                ),
                Center(
                  child: Text("Records of past month"),
                ),
              ],
            ),
          ),
          // MediItemsScreen(), // fetches all the current exercise results from the django server but problems were faced in the future module of flutter, thus this mdule has been commented out
        ],
      ),
    );
  }
}
