part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {
  @override
  String toString() {
    return "HomeInitial";
  }
}

class HomeSuccess extends HomeState {
  @override
  String toString() {
    return "HomeSuccess";
  }
}

class HomeLoading extends HomeState {
  @override
  String toString() {
    return "HomeLoading";
  }
}

class HomeFailure extends HomeState {
  @override
  String toString() {
    return "HomeFailure";
  }
}
