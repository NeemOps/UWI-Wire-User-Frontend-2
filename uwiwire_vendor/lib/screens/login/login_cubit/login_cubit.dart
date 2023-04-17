import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../backend/authentication/_authentication_controller.dart';
import '../../../backend/authentication/_authentication_command.dart';
import '../../../backend/authentication/_login_command.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  AuthenticationController authController = AuthenticationController();
  AuthenticationCommand loginCommand = LoginCommand();

  Future<void> login() async {
    authController.setCommand(loginCommand);
    emit(LoginLoading());
    try {
      await authController.authenticate();
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
