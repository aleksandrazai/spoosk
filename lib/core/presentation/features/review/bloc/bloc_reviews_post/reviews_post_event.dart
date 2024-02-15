part of 'reviews_post_bloc.dart';

@immutable
sealed class ReviewsPostEvent {}

sealed class ReviewsPostSend extends ReviewsPostEvent {
  Reviews? reviews;
  ReviewsPostSend({required this.reviews});
}
