import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_evertec/Blocs/login/login_bloc.dart';
import 'package:test_evertec/Blocs/main/main_bloc.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: LoginUi(),
    );
  }
}

class LoginUi extends StatelessWidget {
  const LoginUi({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        BlocProvider.of<MainBloc>(context).add(LoginSuccessEvent());
      },
      builder: (context, state) {
        if (state is NoLogged) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://cdn5.f-cdn.com/contestentries/1465388/27319887/5c437042565d6_thumb900.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.network(
                        "https://media.workifit.com/media/company/logos/evertec-vvFqq-logo_Oh0DG7m.png",
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          BlocProvider.of<LoginBloc>(context)
                              .add(ChangeFormData("username", value));
                        },
                        decoration: InputDecoration(
                          labelText: 'Usuario',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(16),
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          fillColor: Colors.white70,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          BlocProvider.of<LoginBloc>(context)
                              .add(ChangeFormData("username", value));
                        },
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(16),
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          fillColor: Colors.white70,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      RaisedButton(
                        onPressed: () =>
                            BlocProvider.of<LoginBloc>(context).add(TryLogin()),
                        color: Colors.orange,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 16),
                          child: Text(
                            "Ingresar",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: Text("vacio"),
          );
        }
      },
    );
  }
}
