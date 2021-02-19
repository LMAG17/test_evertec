import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_evertec/Models/Basics/document_type.dart';
import 'package:test_evertec/Models/Basics/person.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final List<DocumentType> documentTypes = [
    DocumentType(name: "Pasaporte", value: "PPN"),
    DocumentType(name: "TAX", value: "TAX"),
    DocumentType(name: "Labeler Identification Code", value: "LIC"),
    DocumentType(name: "Cédula de ciudadanía", value: "CC"),
    DocumentType(name: "Cédula de extranjería", value: "CE"),
    DocumentType(name: "Tarjeta de identidad", value: "TI"),
    DocumentType(name: "Registro Civil", value: "RC"),
    DocumentType(name: "Número de Identificación Tributaria", value: "NIT"),
    DocumentType(name: "Registro único tributario", value: "RUT"),
    DocumentType(name: "Cédula de identidad", value: "CI"),
    DocumentType(name: "Registro Único de Contribuyentes", value: "RUC"),
    DocumentType(name: "Cédula de identidad personal", value: "CIP"),
    DocumentType(name: "Cadastro de Pessoas Físicas", value: "CPF"),
    DocumentType(name: "Social security number", value: "SSN"),
  ];
  Person user = Person();
  RegisterBloc() : super(RegisterInitial());
  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterLoadData) {
      yield RegisterForm(documentTypes);
    }
    if (event is ChangeFormData) {
      switch (event.change) {
        case "name":
          user.name = event.value;
          break;
        case "surname":
          user.surname = event.value;
          break;
        case "documentType":
          user.documentType = event.value;
          break;
        case "document":
          user.document = event.value;
          break;
        case "company":
          user.company = event.value;
          break;
        case "email":
          user.email = event.value;
          break;
        case "mobile":
          user.mobile = event.value;
          break;
        default:
      }
    }
  }
}
