import 'package:flutter/material.dart';
import 'package:recipies/screens/category_screen.dart';
import 'package:recipies/screens/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _initialIndex = 0;
  List _Screens = [
    CategoryScreen(),
    FavoriteScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Recipe'),
      // ),
      body: _Screens[_initialIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
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
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
