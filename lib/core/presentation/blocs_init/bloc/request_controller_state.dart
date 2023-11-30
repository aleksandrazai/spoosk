part of 'request_controller_bloc.dart';

abstract class RequestControllerState {}

class RequestControllerInitial extends RequestControllerState {}

class RequestControllerLoaded extends RequestControllerState {
  RequestControllerLoaded({required this.resortsAll});
  final List<Result> resortsAll;
}
