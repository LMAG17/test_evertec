part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterForm extends RegisterState {
  final List<DocumentType> documentTypes;
  final DocumentType docType;
  RegisterForm(this.documentTypes, {this.docType});
}
