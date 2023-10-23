part of 'request_controller_bloc.dart';

@immutable
sealed class RequestControllerState {}

class RequestControllerInitialState extends RequestControllerState {
  List<Resorts> resortsAll = [];
  RequestControllerInitialState({required this.resortsAll});
}

class RequestControllerNewState extends RequestControllerState {
  List<Resorts> newList = [];
  RequestControllerNewState({required this.newList});
}
