part of 'user_bloc.dart';

class UserProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserProfileInitial extends UserProfileState {
  @override
  List<Object> get props => [];
}

class UserProfileLoad extends UserProfileState {
  @override
  List<Object> get props => [];
}

class UserProfileLoaded extends UserProfileState {
  final UserProfile userProfile;

  UserProfileLoaded({required this.userProfile});
  @override
  List<Object> get props => super.props..add(userProfile);
}

class UserProfileEdited extends UserProfileState {
  final UserProfile userProfile;

  UserProfileEdited({required this.userProfile});
  @override
  List<Object> get props => super.props..add(userProfile);
}

class UserProfileFailed extends UserProfileState {
  @override
  List<Object> get props => [];
}
