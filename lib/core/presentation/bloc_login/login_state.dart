part of 'login_bloc.dart';

class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessfull extends LoginState {
  final UserData userData;

  LoginSuccessfull({required this.userData});
}

class UserProfileFailed extends LoginState {}
