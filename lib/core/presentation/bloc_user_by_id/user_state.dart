part of 'user_bloc.dart';

class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final UserProfile userProfile;

  UserProfileLoaded({required this.userProfile});
}

class UserProfileFailed extends UserProfileState {}
