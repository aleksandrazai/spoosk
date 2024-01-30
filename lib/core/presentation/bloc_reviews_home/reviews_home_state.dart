part of 'reviews_home_bloc.dart';

@immutable
sealed class ReviewsHomeState {
  Reviews? reviews;
  ReviewsHomeState({required this.reviews});
}

final class ReviewsHomeInitial extends ReviewsHomeState {
  Reviews? reviews;
  ReviewsHomeInitial({required this.reviews}) : super(reviews: null);
}

final class ReviewsHomeLoaded extends ReviewsHomeState {
  Reviews? reviews;
  ReviewsHomeLoaded({required this.reviews}) : super(reviews: null);
}
