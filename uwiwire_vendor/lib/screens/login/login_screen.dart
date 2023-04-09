import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// Components
import 'package:uwiwire_vendor/constants.dart';
import '../../backend/authentication/_authentication_controller.dart';
import '../../backend/authentication/_login_command.dart';
import 'components/login_form.dart';

class LoginScreen extends StatefulWidget {
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
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthenticationController _authController = AuthenticationController();

  LoginCommand loginCommand = LoginCommand();

  late String? accessToken;

  bool _loading = false;

  void _login() {
    setState(() {
      _loading = true;
    });

    // Simulate a network request
    Future.delayed(const Duration(seconds: 3), () async {
      setState(() {
        _loading = false;
      });

      _authController.setCommand(loginCommand);

      try {
        accessToken = await _authController.authenticate();

        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/home');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Incorrect Email or Password.'),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: <Widget>[
          Center(
            child: SingleChildScrollView(
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
                      controller: LoginScreen._usernameController,
                      text: 'Username',
                      textInputType: TextInputType.emailAddress,
                      obscure: false,
                    ),

                    // Space
                    const SizedBox(height: 7),

                    // Password Box
                    LoginForm(
                      controller: LoginScreen._passwordController,
                      text: 'Password',
                      textInputType: TextInputType.text,
                      obscure: true,
                    ),

                    // Space
                    const SizedBox(height: 7),

                    // Log In Button
                    InkWell(
                      // When Pressed
                      onTap: () {
                        _login();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _loading
              ? Positioned.fill(
                  child: Center(
                    child: Flexible(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: kPrimaryColor,
                        child: LoadingAnimationWidget.dotsTriangle(
                            color: kBackgroundColor, size: 100),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
