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
      availableMeals = dummyMeals.where((meal) {
        if ((filters['gluten'] == true) && !meal.isGlutenFree) {
          return false;
        } else if ((filters['vegan'] == true) && !meal.isVegan) {
          return false;
        } else if ((filters['lactose'] == true) && !meal.isLactoseFree) {
          return false;
        } else if ((filters['vegetarian'] == true) && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
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
        FilterScreen.routeName: (context) => FilterScreen(filters, setFilters),
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
