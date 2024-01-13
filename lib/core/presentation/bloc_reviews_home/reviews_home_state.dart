part of 'reviews_home_bloc.dart';

@immutable
sealed class ReviewsHomeState {}

final class ReviewsHomeInitial extends ReviewsHomeState {
  Reviews? reviews;
  ReviewsHomeInitial();
}

final class ReviewsHomeLoaded extends ReviewsHomeState {
  Reviews? reviews;
  ReviewsHomeLoaded({required this.reviews});
}
