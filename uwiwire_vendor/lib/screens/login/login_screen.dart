import 'package:flutter/material.dart';

// Components
import 'package:uwiwire_vendor/constants.dart';
import 'components/login_button.dart';
import 'components/login_form.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  static final TextEditingController _usernameController =
      TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();

  const LoginScreen({super.key});

  static String getUsername() {
    return _usernameController.text;
  }

  static String getPassword() {
    return _passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Text.rich(
                      TextSpan(
                        text: 'UWI',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: kBackgroundColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'wire',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Space
                  const SizedBox(height: 50),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Space
                  const SizedBox(height: 15),

                  // Username Box
                  LoginForm(
                    controller: _usernameController,
                    text: 'Username',
                    textInputType: TextInputType.emailAddress,
                    obscure: false,
                  ),

                  // Space
                  const SizedBox(height: 7),

                  // Password Box
                  LoginForm(
                    controller: _passwordController,
                    text: 'Password',
                    textInputType: TextInputType.text,
                    obscure: true,
                  ),

                  // Space
                  const SizedBox(height: 7),

                  // Log In Button
                  const LoginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
