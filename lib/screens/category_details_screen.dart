import 'package:flutter/material.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String catTitle;
  final Color catColor;
  CategoryDetailsScreen(
      {Key? key, required this.catColor, required this.catTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: Center(
        child: Container(
          color: catColor,
        ),
      ),
    );
  }
}
