part of 'reset_bloc.dart';

class ResetEvent {}

class ResetRequested extends ResetEvent {
  final String email;

  ResetRequested({required this.email});
}
