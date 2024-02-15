part of 'register_bloc.dart';

class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccessfull extends RegisterState {
  final UserRegister userRegister;
  final int id;

  RegisterSuccessfull({required this.userRegister, required this.id});
}

class RegisterFailed extends RegisterState {
  final String errorMessage;

  RegisterFailed({required this.errorMessage});
}

class RegisterError extends RegisterState {}
