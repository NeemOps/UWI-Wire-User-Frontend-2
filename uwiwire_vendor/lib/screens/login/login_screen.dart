import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:uwiwire_vendor/screens/metamask/metamask_screen.dart';

// Components
import 'components/login_form.dart';
import 'login_cubit/login_cubit.dart';
import 'package:uwiwire_vendor/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const Scaffold(
        body: LoginBody(),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  static final TextEditingController _usernameController =
      TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();

  const LoginBody({super.key});

  static String getUsername() {
    return _usernameController.text;
  }

  static String getPassword() {
    return _passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => MetamaskScreen(),
            ),
          );
        }

        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: kPrimaryColor,
                content: Text(state.error),
              ),
            );
        }

        if (state is LoginLoading) {
          Positioned.fill(
            child: Center(
              child: Flexible(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: kBackgroundColor,
                  child: LoadingAnimationWidget.dotsTriangle(
                      color: kPrimaryColor, size: 100),
                ),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
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
                      // "UWIwire"
                      Container(
                        alignment: Alignment.center,
                        child: const Text.rich(
                          TextSpan(
                            text: 'UWI',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'wire',
                                style: TextStyle(
                                  fontSize: 32,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Space
                      const SizedBox(height: 50),

                      // "Login"
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
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<LoginCubit>(context).login();
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
        child: const Center(
          child: Text(
            'Sign In',
            style: TextStyle(
              color: kBackgroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
