import 'package:custom_sidemenu/custom_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:fyp_project/widgets/categories_grid.dart';
import 'package:fyp_project/widgets/mainmenu.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../Client/Client_home_screen.dart';
import '../../widgets/card_slider.dart';
import '../signup_screen.dart';

class HomeClient extends StatefulWidget {
  const HomeClient({super.key});

  @override
  State<HomeClient> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeClient> {
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
      callback: () {},
      title: 'Chat',
      leadingIcon: Icons.chat,
      iconSize: 22,
      titleSize: 16,
    ),
    CustomMenuItem(
      callback: () {},
      title: 'Store',
      leadingIcon: Icons.store_mall_directory_outlined,
      iconSize: 22,
      titleSize: 16,
    ),
    CustomMenuItem(
      callback: () {},
      title: 'Proposal',
      leadingIcon: Icons.wifi_protected_setup_rounded,
      iconSize: 22,
      titleSize: 16,
    ),
    CustomMenuItem(
      callback: () {},
      title: 'Order',
      leadingIcon: Icons.add_box_outlined,
      iconSize: 22,
      titleSize: 16,
    ),
    CustomMenuItem(
      callback: () {},
      title: 'Payment',
      leadingIcon: Icons.payment_outlined,
      iconSize: 22,
      titleSize: 16,
    ),
    CustomMenuItem(
      callback: () {},
      title: 'Setting',
      leadingIcon: Icons.settings,
      iconSize: 22,
      titleSize: 16,
    ),
    CustomMenuItem(
      callback: () {
        Get.to(SignUpScreen());
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
      menuItemsList: menuItemsList,
      appBarActions: [
        CircleAvatar(
          backgroundColor: Color.fromARGB(255, 242, 240, 240),
          child: const Text(
            'AH',
          ),
        )
      ],
      appBarTitle: Text(' Home '),
      menuIcon: const Icon(Icons.menu),
      homeWidget: Center(
        child: Column(
          children: [
            //CardSliderWidget(), CategoriesGrid()
            ClientHomeScreen()
          ],
        ),
      ),
    ));
  }
}
