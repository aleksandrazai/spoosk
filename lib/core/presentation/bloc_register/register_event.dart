part of 'register_bloc.dart';

class RegisterEvent {}

class RegisterFormFilled extends RegisterEvent {
  final String email;
  final String password;
  final String name;

  RegisterFormFilled(
      {required this.email, required this.password, required this.name});
}
