import '_authentication_command.dart';
import '_authentication.dart';

class UpdateAddressCommand implements AuthenticationCommand {
  late Authentication _authInstance;

  UpdateAddressCommand() {
    _authInstance = Authentication();
  }

  @override
  Future<void> execute() async {
    await _authInstance.updateAddress();
  }
}
