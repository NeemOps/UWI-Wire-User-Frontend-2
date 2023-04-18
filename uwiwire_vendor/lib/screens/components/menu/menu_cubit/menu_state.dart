part of 'menu_cubit.dart';

@immutable
abstract class MenuState {}

class MenuInitial extends MenuState {}

class LogoutSuccess extends MenuState {}

class LogoutFailure extends MenuState {
  final String error;
  LogoutFailure(this.error);
}
