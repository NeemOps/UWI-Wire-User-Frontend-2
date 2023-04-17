import 'package:flutter/material.dart';
import 'package:uwiwire_vendor/constants.dart';

import '../../backend/authentication/_authentication_controller.dart';
import '../../backend/authentication/_authentication_command.dart';
import '../../backend/authentication/_logout_command.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final AuthenticationController _authController = AuthenticationController();

  AuthenticationCommand logoutCommand = LogoutCommand();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
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
                  _authController.setCommand(logoutCommand);

                  try {
                    await _authController.authenticate();

                    // ignore: use_build_context_synchronously
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: kPrimaryColor,
                      content: Text(e.toString()),
                    ));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
