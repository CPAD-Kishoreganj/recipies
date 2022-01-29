import 'package:flutter/material.dart';
import 'package:recipies/widgets/my_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = 'filter-screen';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      drawer: MyDrawer(),
    );
  }
}
