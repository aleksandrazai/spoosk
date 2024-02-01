part of 'new_password_bloc.dart';

class NewPasswordEvent {}

class PasswordEntered extends NewPasswordEvent {
  final String password;
  final num id;
  final String token;

  PasswordEntered(
      {required this.password, required this.id, required this.token});
}
