import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

import 'screens/payment/qr_scanner/peer_scanner.dart';

import 'screens/login/login_screen.dart';
import 'screens/home/nav_screen.dart';
import 'screens/metamask_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Platform | UWIwire',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: TextTheme(
          bodyMedium:
              GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      home: const LoginScreen(),
      routes: {
        '/metamaskRoute': (context) => const MetamaskScreen(),
        '/homeRoute': (context) => const NavScreen(),
        '/scanner': (context) => const PeerScanner(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
