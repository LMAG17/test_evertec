part of 'pay_bloc.dart';

@immutable
abstract class PayState {}

class PayInitial extends PayState {}

class PaySuccess extends PayState {}

class PayLoading extends PayState {}

class PayFailure extends PayState {}
