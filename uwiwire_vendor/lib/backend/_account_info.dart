import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountInfo {
  static String _fName = '';
  static String _lName = '';
  static String _email = '';
  static dynamic _balance = 0;
  static dynamic _walletAddr = 0;

  Future<void> getAccountInfo(String accessToken) async {
    const uri = 'https://uwi-wire.herokuapp.com/api/v1/user/identify';

    final response = await http.get(
      Uri.parse(uri),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      _fName = decoded['fname'];
      _lName = decoded['lname'];
      _email = decoded['email'];

      _walletAddr = decoded['walletAddr'];
      _balance = decoded['balance'];
    } else {
      throw Exception('Failed to load account information');
    }
  }

  String getName() {
    return '$_fName $_lName';
  }

  String getEmail() {
    return _email;
  }

  dynamic getWalletAddress() {
    return _walletAddr;
  }

  dynamic getBalance() {
    return _balance;
  }
}
