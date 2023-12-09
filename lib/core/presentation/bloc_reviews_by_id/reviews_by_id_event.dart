part of 'resort_by_id_bloc.dart';

@immutable
sealed class ReviewsByIdEvent {}

class EventLoadByIdReviews extends ReviewsByIdEvent {
  String? idResort;
  EventLoadByIdReviews({required this.idResort});
}
