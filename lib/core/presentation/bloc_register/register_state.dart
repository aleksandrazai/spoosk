part of 'register_bloc.dart';

class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccessfull extends RegisterState {
  final UserProfile userProfile;
  final int id;

  RegisterSuccessfull({required this.userProfile, required this.id});
}

class RegisterFailed extends RegisterState {}

class RegisterError extends RegisterState {}
