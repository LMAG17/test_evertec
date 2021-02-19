part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class NoLogged extends LoginState {
  @override
  String toString() {
    return "NoLogged";
  }
}

class LoginSuccess extends LoginState {
  @override
  String toString() {
    return "LoginSuccess";
  }
}

class LoginLoading extends LoginState {
  @override
  String toString() {
    return "LoginLoading";
  }
}

class LoginFailure extends LoginState {
  @override
  String toString() {
    return "LoginFailure";
  }
}
