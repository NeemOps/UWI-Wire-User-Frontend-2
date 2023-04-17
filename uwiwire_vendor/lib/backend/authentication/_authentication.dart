import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uwiwire_vendor/screens/login/login_screen.dart';

import '../../repository/keys.dart';
import '../../repository/repository.dart';
import '../_account_info.dart';

class Authentication {
  Repository repo = Repository();

  // Login
  Future<String?> login() async {
    String email = LoginScreen.getUsername();
    String password = LoginScreen.getPassword();

    const uri = 'https://uwi-wire.herokuapp.com/api/v1/auth/users';

    final response = await http.post(
      Uri.parse(uri),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      var token = json.decode(response.body)['access_token'];

      // Add Token to User Repository
      repo.write(tokenKey, token);

      // Load Account info
      final AccountInfo accountInfo = AccountInfo();
      accountInfo.getAccountInfo(token);

      return token;
    } else {
      return null;
    }
  }

  // Logout
  Future<void> logout() async {
    await repo.clear();
  }
}
