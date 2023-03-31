import '_authentication_command.dart';

class AuthenticationController {
  late AuthenticationCommand _command;

  void setCommand(AuthenticationCommand command) {
    _command = command;
  }

  Future<String> authenticate() async {
    return await _command.execute();
  }
}
