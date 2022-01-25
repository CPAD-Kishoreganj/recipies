import 'package:flutter/material.dart';
import 'package:recipies/data/category.dart';
import 'package:recipies/models/category.dart';
import 'package:recipies/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  final List<Category> categoris = dummyCategories;

  CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CategoryScreen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemCount: categoris.length,
          itemBuilder: (context, index) {
            return CategoryItem(
              id: categoris[index].id,
              title: categoris[index].title,
              color: categoris[index].color,
            );
          },
        ),
      ),
    );
  }
}
