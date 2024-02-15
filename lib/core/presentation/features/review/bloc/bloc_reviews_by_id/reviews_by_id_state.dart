// ignore_for_file: must_be_immutable

part of 'reviews_by_id_bloc.dart';

class ReviewsByIdState {
  List<Review>? reviews;
  ReviewsByIdState({List<Reviews>? reviews});
}

class ReviewsByIdInitial extends ReviewsByIdState {}

class ReviewsByIdLoaded extends ReviewsByIdState {
  List<Review>? reviews;
  ReviewsByIdLoaded({required this.reviews});
}
