part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterLoadData extends RegisterEvent {}

class ChangeFormData extends RegisterEvent {
  final String change;
  final String value;

  ChangeFormData(this.change, this.value);
}
