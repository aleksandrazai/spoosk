part of 'user_reviews_bloc.dart';

@immutable
sealed class UserReviewsEvent {}

class LoadUserReviews extends UserReviewsEvent {
  final int id;

  LoadUserReviews({required this.id});
}

class DeleteReview extends UserReviewsEvent {}

class EditReview extends UserReviewsEvent {}
