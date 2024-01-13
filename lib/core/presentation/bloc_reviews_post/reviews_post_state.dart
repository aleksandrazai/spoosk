part of 'reviews_post_bloc.dart';

@immutable
sealed class ReviewsPostState {}

final class ReviewsPostInitial extends ReviewsPostState {}

final class ReviewsPostMessage extends ReviewsPostState {
  Reviews? sendReviews;
  ReviewsPostMessage({required this.sendReviews});
}
