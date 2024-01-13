// ignore_for_file: must_be_immutable

part of 'user_reviews_bloc.dart';

class UserReviewsState {}

class UserReviewsInitial extends UserReviewsState {}

class UserReviewsLoaded extends UserReviewsState {
  Reviews? reviews;
  UserReviewsLoaded({required this.reviews});
}

class UserReviewsFailed extends UserReviewsState {}
