import 'package:flutter/material.dart';
import 'package:recipies/screens/category_screen.dart';
import 'package:recipies/screens/filter_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, VoidCallback ontapHandle) {
    return ListTile(
      tileColor: Colors.grey.shade300,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22,
        ),
      ),
      onTap: ontapHandle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Container(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              height: 100,
              child: const Text(
                'My Drawer',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              color: Colors.amber,
            ),
          ),
          buildListTile('Recipies', Icons.restaurant, () {
            Navigator.of(context).pushNamed(CategoryScreen.routeName);
          }),
          const SizedBox(height: 12),
          buildListTile('Filter', Icons.filter, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
