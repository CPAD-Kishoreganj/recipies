import 'package:flutter/material.dart';
import 'package:recipies/data/category.dart';
import 'package:recipies/models/meal.dart';
import 'package:recipies/screens/category_details_screen.dart';
import 'package:recipies/screens/filter_screen.dart';
import 'package:recipies/screens/meal_details.dart';
import 'package:recipies/screens/tab_screen.dart';

import 'screens/category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'vegan': false,
    'lactose': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = dummyMeals;

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      // home: CategoryScreen(),
      routes: {
        '/': (context) => TabScreen(),
        FilterScreen.routeName: (context) =>
            FilterScreen(setFilters: setFilters),
        CategoryScreen.routeName: (context) => CategoryScreen(),
        CategoryDetailsScreen.routeName: (context) => CategoryDetailsScreen(
              availableMeals: availableMeals,
            ),
        MealDetails.routName: (context) => MealDetails(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return CategoryScreen();
        });
      },
    );
  }
}
