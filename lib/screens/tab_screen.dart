import 'package:flutter/material.dart';
import 'package:recipies/screens/category_screen.dart';
import 'package:recipies/screens/favorite_screen.dart';
import 'package:recipies/widgets/my_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _initialIndex = 0;
  final List<Map<String, dynamic>> _screens = [
    {
      'screen': CategoryScreen(),
      'title': 'Recipe',
    },
    {
      'screen': FavoriteScreen(),
      'title': 'Favorite',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_initialIndex]['title']),
      ),
      drawer: MyDrawer(),
      body: _screens[_initialIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.blue,
        currentIndex: _initialIndex,
        onTap: (value) {
          setState(() {
            _initialIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
