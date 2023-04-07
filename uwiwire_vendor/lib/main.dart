import 'package:flutter/material.dart';
import 'package:uwiwire_vendor/screens/home/nav_screen.dart';
import 'package:uwiwire_vendor/screens/metamask_screen.dart';

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
      routes: {
        '/home': (context) => const NavScreen(),
        '/metamask': (context) => const MetamaskScreen(),
      },
    );
  }
}
