part of 'user_bloc.dart';

class UserProfileEvent {}

class GetUserInfo extends UserProfileEvent {
  final UserProfile userProfile;

  GetUserInfo({required this.userProfile});
}
