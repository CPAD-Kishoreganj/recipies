// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recipies/widgets/my_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'filter-screen';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isVeganFree = false;
  bool _isVegetarianFree = false;
  bool _isLactoseFree = false;

  Widget buildSwitchListTile(
    String title,
    bool value,
    Function(bool) ontap,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 22),
      ),
      value: value,
      onChanged: ontap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      drawer: MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Choose your desired meals',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Gluten Free',
                  _isGlutenFree,
                  (newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegan Free',
                  _isVeganFree,
                  (newValue) {
                    setState(() {
                      _isVeganFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian Free',
                  _isVegetarianFree,
                  (newValue) {
                    setState(() {
                      _isVegetarianFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactos Free',
                  _isLactoseFree,
                  (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
