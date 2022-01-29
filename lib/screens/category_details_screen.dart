import 'package:flutter/material.dart';
import 'package:recipies/data/category.dart';
import 'package:recipies/widgets/meal_item.dart';

class CategoryDetailsScreen extends StatefulWidget {
  static String routeName = 'category-details';

  const CategoryDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final catTitle = routeArgs['title'];
    final catId = routeArgs['id'];
    final catMeals = dummyMeals.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
        itemCount: catMeals.length,
        itemBuilder: (context, index) {
          final meal = catMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
          );
        },
      ),
    );
  }
}
