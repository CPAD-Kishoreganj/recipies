import 'package:flutter/material.dart';
import 'package:recipies/data/category.dart';

class MealDetails extends StatelessWidget {
  static const routName = '/meal-details';
  const MealDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 200,
                right: 100,
                child: Text('Next'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
