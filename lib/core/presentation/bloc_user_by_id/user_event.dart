part of 'user_bloc.dart';

class UserProfileEvent {}

class GetUserInfo extends UserProfileEvent {
  final int userId;

  GetUserInfo({required this.userId});
}

class UserLogOut extends UserProfileEvent {}
