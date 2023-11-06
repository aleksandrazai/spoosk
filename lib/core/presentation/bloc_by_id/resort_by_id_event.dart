part of 'resort_by_id_bloc.dart';

@immutable
sealed class ResortByIdEvent {}

class EventLoadByIdResort extends ResortByIdEvent {
  String? idResort;
  EventLoadByIdResort({required this.idResort});
}
