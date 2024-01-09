part of 'reset_bloc.dart';

class ResetState {}

class ResetInitial extends ResetState {}

class ResetLoading extends ResetState {}

class ResetSuccessfull extends ResetState {
  final int id;

  ResetSuccessfull({required this.id});
}

class ResetFailed extends ResetState {
  final String errorMessage;

  ResetFailed({required this.errorMessage});
}

class ResetError extends ResetState {}
