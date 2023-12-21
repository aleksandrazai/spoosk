part of 'verify_code_bloc.dart';

class VerifyCodeEvent {}

class EnterCode extends VerifyCodeEvent {
  final String code;
  final int id;

  EnterCode({
    required this.code,
    required this.id,
  });
}
