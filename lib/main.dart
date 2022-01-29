import 'package:flutter/material.dart';
import 'package:recipies/screens/category_details_screen.dart';
import 'package:recipies/screens/meal_details.dart';

import 'screens/category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/': (context) => CategoryScreen(),
        CategoryDetailsScreen.routeName: (context) => CategoryDetailsScreen(),
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
