part of 'user_bloc.dart';

class UserProfileEvent {}

class GetUserInfo extends UserProfileEvent {
  final int userId;

  GetUserInfo({required this.userId});
}

class UserLogOut extends UserProfileEvent {
  final int userId;

  UserLogOut({required this.userId});
}

class EditUserProfile extends UserProfileEvent {
  final int userId;
  final String firstName;
  final String lastName;
  final String nickName;
  final String country;
  final String city;

  EditUserProfile(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.nickName,
      required this.country,
      required this.city});
}
