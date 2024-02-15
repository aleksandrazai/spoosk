part of 'verify_code_bloc.dart';

class VerifyCodeState {}

class VerifyCodeInitial extends VerifyCodeState {}

class VerifyCodeSuccessfull extends VerifyCodeState {
  final int id;
  final UserData userdata;

  VerifyCodeSuccessfull({required this.id, required this.userdata});
}

class VerifyCodeFailed extends VerifyCodeState {}
