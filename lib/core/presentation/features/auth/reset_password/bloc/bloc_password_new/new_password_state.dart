part of 'new_password_bloc.dart';

class NewPasswordState {}

class NewPasswordInitial extends NewPasswordState {}

class NewPasswordLoading extends NewPasswordState {}

class NewPasswordSuccessfull extends NewPasswordState {}

class NewPasswordFailed extends NewPasswordState {
  final String errorMessage;

  NewPasswordFailed({required this.errorMessage});
}

class NewPasswordError extends NewPasswordState {}
