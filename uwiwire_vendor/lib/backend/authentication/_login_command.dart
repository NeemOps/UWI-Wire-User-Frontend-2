import '_authentication_command.dart';
import '_authentication.dart';

class LoginCommand implements AuthenticationCommand {
  late Authentication _authInstance;

  LoginCommand() {
    _authInstance = Authentication();
  }

  @override
  Future<void> execute() async {
    await _authInstance.login();
  }
}
