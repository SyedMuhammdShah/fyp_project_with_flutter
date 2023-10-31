import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_project/screens/Venders%20Screen/dashboard.dart';
import 'package:fyp_project/screens/Venders%20Screen/orderScreen.dart';
import 'package:fyp_project/screens/Venders%20Screen/productScreen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeVender extends StatefulWidget {
  const HomeVender({super.key});

  @override
  State<HomeVender> createState() => _HomeVenderState();
}

User? getCurrentUser() {
  final user_profile = FirebaseAuth.instance.currentUser;
  return user_profile;
}

class _HomeVenderState extends State<HomeVender> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    User? user_profile = getCurrentUser();
    if (user_profile != null) {
      print('User UID: ${user_profile.uid}');
      print('User Email: ${user_profile.email}');
      print('User Display Name: ${user_profile.phoneNumber}');
    }
    int _selectedIndex = 0;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Dashboard(),
          OrderScreen(),
          ProductScreen(),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 18, 64, 215),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
          child: GNav(
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(108, 119, 142, 216),
            gap: 8,
            padding: EdgeInsets.all(14),
            duration: Duration(milliseconds: 300),
            onTabChange: _changePage,
            tabs: const [
              GButton(
                icon: Icons.dashboard_customize_rounded,
                text: 'Dashboard',
              ),
              GButton(
                icon: Icons.add_box_outlined,
                text: 'Order',
              ),
              GButton(
                icon: Icons.production_quantity_limits_rounded,
                text: 'Product',
              ),
              GButton(
                icon: Icons.supervised_user_circle_rounded,
                text: 'Customer',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
