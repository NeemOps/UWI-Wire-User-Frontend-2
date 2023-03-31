import 'package:flutter/material.dart';
import 'package:uwiwire_vendor/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm(
      {super.key,
      required this.controller,
      required this.text,
      required this.textInputType,
      required this.obscure});

  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        border: Border.all(color: kBackgroundColor, width: 0.5),
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
