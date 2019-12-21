import 'package:flutter/material.dart';
import 'screens/food/food_items_tab_bar_screen.dart';
import 'screens/excercise/medi_items_tab_bar_screen.dart';
import 'screens/step/steps_items_tab_bar_screen.dart';

class Categories extends StatefulWidget {
  @override
  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  void selectCatgoryFood(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      FoodItemsTabBar.routeName,
    );
  }

  void selectCatgoryMedi(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MediItemsTabBar.routeName,
    );
  }

  void selectCatgorySteps(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      StepsItemsTabBar.routeName,
    );
  }

  Widget containerAll(String text) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(20),
      child: Text(text),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.withOpacity(0.7),
            Colors.blue,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        InkWell(
          onTap: () {
            selectCatgoryFood(context);
          },
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
          child: containerAll('Food'),
        ),
        InkWell(
          onTap: () {
            selectCatgoryMedi(context);
          },
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
          child: containerAll('Excercise'),
        ),
        InkWell(
          onTap: () {
            selectCatgorySteps(context);
          },
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
          child: containerAll('Steps'),
        ),
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
