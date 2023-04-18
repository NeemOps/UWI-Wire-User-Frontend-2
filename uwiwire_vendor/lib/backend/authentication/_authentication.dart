import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:uwiwire_vendor/screens/login/login_screen.dart';

import '../../repository/keys.dart';
import '../../repository/repository.dart';
import '../_account_info.dart';

class Authentication {
  Repository repo = Repository();

  // Login
  Future<void> login() async {
    String email = LoginBody.getUsername();
    String password = LoginBody.getPassword();

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
    }
  }

  // Logout
  Future<void> logout() async {
    await repo.clear();
  }

  Future<void> updateAddress() async {
    String? addr = await repo.read(addrKey);
    String? token = await repo.read(tokenKey);

    const uri = 'https://uwi-wire.herokuapp.com/api/v1/user/update/address';

    await http.put(
      Uri.parse(uri),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({"address": addr}),
    );
  }
}
