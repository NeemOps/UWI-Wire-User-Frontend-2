import 'package:uwiwire_vendor/backend/authentication/_authentication_command.dart';

import '_authentication.dart';

class LoginCommand implements AuthenticationCommand {
  late Authentication _authInstance;

  LoginCommand() {
    _authInstance = Authentication();
  }

  @override
  Future<String> execute() async {
    final result = await _authInstance.login();
    if (result != null) {
      return result;
    } else {
      throw Exception('Login failed');
    }
  }
}
