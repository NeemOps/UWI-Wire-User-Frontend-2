import 'package:flutter/material.dart';
import 'package:uwiwire_vendor/constants.dart';
import 'package:uwiwire_vendor/screens/home/components/home_body.dart';

import '../account_screen.dart';
import '../components/appbar/top_bar.dart';
import '../components/menu/menu.dart';
import '../payment/payment_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _currentIndex = 0;

  final List<Widget> _bodyOptions = <Widget>[
    HomeBody(),
    const PaymentScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,

      // Sidebar
      drawer: Menu(),

      // App Bar
      appBar: TopBar.buildAppBar(context),

      // Body
      body: Container(
        child: _bodyOptions.elementAt(_currentIndex),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: buildBottomNav()),
    );
  }

  // Bottom Navigation Bar
  BottomNavigationBar buildBottomNav() {
    return BottomNavigationBar(
      fixedColor: kPrimaryColor,
      backgroundColor: kGrey,
      currentIndex: _currentIndex,
      items: const <BottomNavigationBarItem>[
        // Home Icon
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),

        // Bill Icon
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner_outlined),
          label: 'Payment',
        ),

        // Account Icon
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
