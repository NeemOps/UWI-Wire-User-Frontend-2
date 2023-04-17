import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../backend/authentication/_authentication_command.dart';
import '../../../../backend/authentication/_authentication_controller.dart';
import '../../../../backend/authentication/_logout_command.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());

  AuthenticationController authController = AuthenticationController();
  AuthenticationCommand logoutCommand = LogoutCommand();

  Future<void> logout() async {
    authController.setCommand(logoutCommand);

    try {
      await authController.authenticate();
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure(e.toString()));
    }
  }
}
