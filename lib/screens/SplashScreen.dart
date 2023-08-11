import 'package:flutter/material.dart';
import 'package:fyp_project/screens/home_screen.dart';
import 'package:fyp_project/screens/login_screen.dart';
import 'package:fyp_project/screens/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation completed, navigate to the next screen
        // Use Navigator.pushReplacement to avoid coming back to the splash screen
        Get.to(WelcomeScreen()); // Replace with your route
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 18, 64, 215),
        child: Center(
          child: FadeTransition(
            opacity: _animationController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/svWhite_logo.png',
                  width: 250,
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/loading.gif',
                  width: 100,
                  height: 100,
                ),
                // Text(
                //   'Your App Name',
                //   style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
