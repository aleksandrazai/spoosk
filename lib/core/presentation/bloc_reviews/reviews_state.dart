part of 'reviews_bloc.dart';

class ReviewsState {}

class ReviewsInitial extends ReviewsState {}

class ReviewsLoaded extends ReviewsState {
  final List<Review> reviewsAll;

  ReviewsLoaded({required this.reviewsAll});
}
