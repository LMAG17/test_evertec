import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_evertec/Blocs/register/register_bloc.dart';
import 'package:test_evertec/Models/Basics/document_type.dart';

class Register extends StatelessWidget {
  const Register({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc()..add(RegisterLoadData()),
      child: RegisterUi(),
    );
  }
}

class RegisterUi extends StatelessWidget {
  const RegisterUi({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is RegisterForm) {
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Registro",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          // BlocProvider.of<RegisterBloc>(context)
                          //     .add(ChangeFormData("username", value));
                        },
                        decoration: InputDecoration(
                          labelText: 'Nombre',
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
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          // BlocProvider.of<RegisterBloc>(context)
                          //     .add(ChangeFormData("username", value));
                        },
                        decoration: InputDecoration(
                          labelText: 'Apellido',
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
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: 'Tipo de documento',
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(16.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          fillColor: Colors.white70,
                        ),
                        iconSize: 0,
                        value: state.docType,
                        items: state.documentTypes.map((DocumentType value) {
                          return new DropdownMenuItem<String>(
                            value: value.value,
                            child: new Text(value.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          BlocProvider.of<RegisterBloc>(context)
                              .add(ChangeFormData("documentType", value));
                          print(value);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          // BlocProvider.of<RegisterBloc>(context)
                          //     .add(ChangeFormData("username", value));
                        },
                        decoration: InputDecoration(
                          labelText: 'Numero de documento',
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
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          // BlocProvider.of<RegisterBloc>(context)
                          //     .add(ChangeFormData("username", value));
                        },
                        decoration: InputDecoration(
                          labelText: 'Compañia',
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
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          // BlocProvider.of<RegisterBloc>(context)
                          //     .add(ChangeFormData("username", value));
                        },
                        decoration: InputDecoration(
                          labelText: 'Correo electronico',
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
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          // BlocProvider.of<RegisterBloc>(context)
                          //     .add(ChangeFormData("username", value));
                        },
                        decoration: InputDecoration(
                          labelText: 'Direccion',
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
                          // BlocProvider.of<RegisterBloc>(context)
                          //     .add(ChangeFormData("username", value));
                        },
                        decoration: InputDecoration(
                          labelText: 'Numero telefonico',
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
                      Align(
                        alignment: Alignment.center,
                        child: RaisedButton(
                          onPressed: () {
                            // BlocProvider.of<RegisterBloc>(context).add(TryLogin());
                          },
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
