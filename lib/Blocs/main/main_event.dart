part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class AppStarted extends MainEvent {}

class LoginSuccessEvent extends MainEvent {}

class GenerateNewPay extends MainEvent {}
