import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(NoLogged());
  String username;
  String password;
  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is ChangeFormData) {
      switch (event.change) {
        case "username":
          username = event.value;
          break;
        case "password":
          password = event.value;
          break;
        default:
      }
      print("username $username");
      print("password $password");
    } else if (event is TryLogin) {
      yield* _mapTryLoginToState();
    }
  }

  Stream<LoginState> _mapTryLoginToState() async* {
    yield LoginSuccess();
  }
}
