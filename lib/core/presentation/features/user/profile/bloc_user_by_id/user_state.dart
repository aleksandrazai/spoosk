part of 'user_bloc.dart';

class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoad extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final UserProfile userProfile;

  UserProfileLoaded({required this.userProfile});
}

class UserProfileEdited extends UserProfileState {
  final UserProfile userProfile;

  UserProfileEdited({required this.userProfile});
}

class UserProfileFailed extends UserProfileState {}
