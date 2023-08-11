import 'package:flutter/material.dart';
import 'package:fyp_project/route.dart';
import 'package:fyp_project/screens/SplashScreen.dart';
import 'package:fyp_project/screens/home_screen.dart';
import 'package:fyp_project/screens/login_screen.dart';
import 'package:fyp_project/screens/signup_screen.dart';
import 'package:fyp_project/screens/welcome_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SignUpScreen(),
        MainRoutes.HomeScreen: (context) => HomeScreen(),
        MainRoutes.LoginScreen: (context) => LoginScreen(),
        MainRoutes.SignUpScreen: (context) => SignUpScreen(),
        MainRoutes.SplashScreen: (context) => SplashScreen(),
        MainRoutes.WelcomeScreen: (context) => WelcomeScreen(),
      },
    );
  }
}
