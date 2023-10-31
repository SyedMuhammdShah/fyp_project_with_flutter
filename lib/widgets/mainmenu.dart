import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:custom_sidemenu/custom_sidemenu.dart';

class MainMenu extends StatelessWidget {
  MainMenu({super.key});
  List<CustomMenuItem> menuItemsList = [
    CustomMenuItem(
      callback: () {
        //Callback function to route to page on Click
      },
      title: 'Home',
      leadingIcon: Icons.home,
      iconSize: 22,
      titleSize: 16,
    ),
    CustomMenuItem(
      callback: () {
        //Callback function to route to page on Click
      },
      title: 'History',
      leadingIcon: Icons.history,
      iconSize: 22,
      titleSize: 16,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomDrawer(
      homeWidget: Center(
        child: Text('Your Home Widget'),
      ),
      menuItemsList: menuItemsList,
      appBarActions: [],
      appBarTitle: Text('Your Home Widget'),
      menuIcon: Icon(Icons.menu),
    ));
  }
}
