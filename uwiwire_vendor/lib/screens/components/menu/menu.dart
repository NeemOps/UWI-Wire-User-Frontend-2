import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uwiwire_vendor/constants.dart';

import 'menu_cubit/menu_cubit.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit(),
      child: const Drawer(
        child: MenuBody(),
      ),
    );
  }
}

class MenuBody extends StatelessWidget {
  const MenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MenuCubit, MenuState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
        }

        if (state is LogoutFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: kPrimaryColor,
                content: Text(state.error),
              ),
            );
        }
      },
      child: Column(
        children: [
          // Profile
          Container(
            color: kPrimaryColor,
            height: MediaQuery.of(context).size.height * 0.3,
          ),

          // Home
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/homeRoute');
            },
          ),

          // Transactions
          ListTile(
            leading: const Icon(Icons.money_rounded),
            title: const Text('Transactions'),
            onTap: () {
              Navigator.pushNamed(context, '/transactionsRoute');
            },
          ),

          // Logout
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                tileColor: Colors.red,

                // Power Icon
                leading: const Icon(
                  Icons.power_settings_new_outlined,
                  color: kBackgroundColor,
                  size: 30,
                ),

                // "Log Out"
                title: const Text(
                  'Log Out',
                  style: TextStyle(color: kBackgroundColor, fontSize: 20),
                ),
                onTap: () async {
                  BlocProvider.of<MenuCubit>(context).logout();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
