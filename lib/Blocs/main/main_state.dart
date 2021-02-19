part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class UnAuthenticated extends MainState {
  @override
  String toString() {
    return "UnAuthenticated";
  }
}

class Authenticated extends MainState {
  @override
  String toString() {
    return "Authenticated";
  }
}

class AuthenticatedWithOutData extends MainState {
  @override
  String toString() {
    return "AuthenticatedWithOutData";
  }
}

class MainGeneratePay extends MainState {
  @override
  String toString() {
    return "MainGeneratePay";
  }
}
