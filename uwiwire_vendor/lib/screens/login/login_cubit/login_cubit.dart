import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../backend/authentication/_authentication_controller.dart';
import '../../../backend/authentication/_authentication_command.dart';
import '../../../backend/authentication/_login_command.dart';

import '../../../repository/repository.dart';
import '../../../repository/keys.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  AuthenticationController authController = AuthenticationController();
  AuthenticationCommand loginCommand = LoginCommand();
  Repository repo = Repository();

  Future<void> login() async {
    emit(LoginLoading());

    authController.setCommand(loginCommand);

    try {
      await authController.authenticate();
      try {
        bool tokePresent = await repo.containsKey(tokenKey);
        if (tokePresent) {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure('Incorrect Username or Password'));
        }
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
