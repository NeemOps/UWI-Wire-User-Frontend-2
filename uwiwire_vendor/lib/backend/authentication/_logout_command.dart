import '_authentication_command.dart';
import '_authentication.dart';

class LogoutCommand implements AuthenticationCommand {
  late Authentication _authInstance;

  LogoutCommand() {
    _authInstance = Authentication();
  }

  @override
  Future<void> execute() async {
    await _authInstance.logout();
  }
}
