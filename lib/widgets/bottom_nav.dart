import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Text(
            'Selected Tab: $_selectedIndex',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        bottomNavigationBar: MoltenBottomNavigationBar(
          selectedIndex: _selectedIndex,
          domeHeight: 25,
          onTabChange: (clickedIndex) {
            setState(() {
              _selectedIndex = clickedIndex;
            });
          },
          tabs: [
            MoltenTab(
              icon: Icon(Icons.search),
            ),
            MoltenTab(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            MoltenTab(
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
