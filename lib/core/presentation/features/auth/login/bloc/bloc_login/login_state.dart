part of 'login_bloc.dart';

class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessfull extends LoginState {
  final UserData userData;
  final int id;

  LoginSuccessfull({required this.userData, required this.id});
}

class LoginFailed extends LoginState {}

class LoginError extends LoginState {}
