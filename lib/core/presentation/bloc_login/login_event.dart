part of 'login_bloc.dart';

class LoginEvent {}

class FilledFormEvent extends LoginEvent {
  final String email;
  final String password;

  FilledFormEvent({required this.email, required this.password});
}
