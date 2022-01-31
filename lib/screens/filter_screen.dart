// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recipies/screens/category_screen.dart';
import 'package:recipies/widgets/my_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'filter-screen';
  Function setFilters;

  Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.setFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentFilters['gluten']!;
    _isVegan = widget.currentFilters['vegan']!;
    _isVegetarian = widget.currentFilters['vegetarian']!;
    _isLactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

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
        actions: [
          IconButton(
            onPressed: () {
              var filtedMeals = {
                'gluten': _isGlutenFree,
                'vegan': _isVegan,
                'lactose': _isLactoseFree,
                'vegetarian': _isVegetarian,
              };
              widget.setFilters(filtedMeals);
            },
            icon: Icon(Icons.save),
          ),
        ],
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
                  'Vegan',
                  _isVegan,
                  (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  _isVegetarian,
                  (newValue) {
                    setState(() {
                      _isVegetarian = newValue;
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
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            child: Text("Show Filtered Meals"),
          ),
          SizedBox(height: 224),
        ],
      ),
    );
  }
}
