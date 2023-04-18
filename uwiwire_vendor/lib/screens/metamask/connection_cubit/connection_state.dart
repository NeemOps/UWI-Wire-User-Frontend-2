part of 'connection_cubit.dart';

@immutable
abstract class MetamaskConnectionState {}

class ConnectionInitial extends MetamaskConnectionState {}

class ConnectionLoading extends MetamaskConnectionState {
  ConnectionLoading();
}

class ConnectionSuccess extends MetamaskConnectionState {
  final dynamic session;

  ConnectionSuccess({
    required this.session,
  });
}

class ConnectionFailed extends MetamaskConnectionState {
  final String errorCode;
  final String message;

  ConnectionFailed({required this.errorCode, required this.message});
}

class SessionDisconnected extends MetamaskConnectionState {}

class MetamaskConnectionLoading extends MetamaskConnectionState {}

class MetamaskConnectionSuccess extends MetamaskConnectionState {
  final String url;

  MetamaskConnectionSuccess({required this.url});
}

class MetamaskConnectionFailed extends MetamaskConnectionState {
  final String error;
  MetamaskConnectionFailed(this.error);
}
