import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nonce/nonce.dart';
import 'package:test_evertec/Blocs/main/main_bloc.dart';
import 'package:test_evertec/UI/generate_pay.dart';
import 'package:test_evertec/UI/login.dart';
import 'package:test_evertec/UI/register_user.dart';

import 'Blocs/main/simple_bloc_delegate.dart';
import 'UI/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocDelegate();
  runApp(
    BlocProvider(
      create: (context) => MainBloc()..add(AppStarted()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  get stringToBase64 => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evertec prueba',
      debugShowCheckedModeBanner: false,
      home: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {
          print(state.toString());
        },
        builder: (context, state) {
          if (state is UnAuthenticated) {
            // return Login();
            return Register();
          } else if (state is Authenticated) {
            return Home();
          } else if (state is MainGeneratePay) {
            return GeneratePay();
          } else {
            return Text("Vacio");
          }
        },
      ),
    );
  }
}
