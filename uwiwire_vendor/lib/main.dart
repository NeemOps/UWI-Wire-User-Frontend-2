import 'package:flutter/material.dart';
import 'package:uwiwire_vendor/screens/home/nav_screen.dart';

import 'constants.dart';
import 'screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vendor Platform | UWIwire',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
      ),
      home: const LoginScreen(),
      // home: const NavScreen(),
      routes: {
        '/home': (context) => const NavScreen(),
      },
    );
  }
}
