part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class ChangeFormData extends LoginEvent {
  final String change;
  final String value;

  ChangeFormData(this.change, this.value);
}

class TryLogin extends LoginEvent {}
