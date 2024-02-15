import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/API/ApiConfig.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/DB/DBController_user_auth.dart';
import 'package:spoosk/core/data/models/user_profile.dart';
import 'package:spoosk/core/domain/useCases/SetUserToken.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final DBControllerUserAuth dbcontrollerUserAuth = DBControllerUserAuth();
  UserProfileLoaded? getUserInfo() {
    if (state is UserProfileLoaded) {
      return (state as UserProfileLoaded);
    }
    return null;
  }

  static UserProfileBloc bloc(BuildContext context) =>
      context.read<UserProfileBloc>();
  UserProfileBloc() : super(UserProfileInitial()) {
    on<GetUserInfo>(_onGetUserInfo);
    on<UserLogOut>(_onUserLogout);
    on<EditUserProfile>(_onProfileEdit);
  }

  int? getUserId() {
    if (state is UserProfileLoaded) {
      return (state as UserProfileLoaded).userProfile.id;
    }

    return null;
  }

  void _onGetUserInfo(
    GetUserInfo event,
    Emitter<UserProfileState> emit,
  ) async {
    print("_onGetUserInfo ${event.userId}");
    RequestController requestController = RequestController();

    final UserProfile? userProfile = await requestController.getUserProfile(
        getUserProfile: ApiConfigurateGet.getUserProfile, id: event.userId);
    emit(UserProfileLoad());
    if (userProfile != null) {
      emit(UserProfileLoaded(userProfile: userProfile));
    } else {
      emit(UserProfileFailed());
    }
  }

  void _onUserLogout(UserLogOut event, Emitter<UserProfileState> emit) {
    dbcontrollerUserAuth.delete(event.userId);
    UserTokenConfig.setToken('');
    emit(UserProfileInitial());
  }

  void _onProfileEdit(
      EditUserProfile event, Emitter<UserProfileState> emit) async {
    RequestController requestController = RequestController();
    final UserProfile? newUserProfile = await requestController.editProfile(
        editProfile: ApiConfigPatch.editProfile,
        id: event.userId,
        firstName: event.firstName,
        lastName: event.lastName,
        nickName: event.nickName,
        country: event.country,
        city: event.city);
    if (newUserProfile != null) {
      emit(UserProfileEdited(userProfile: newUserProfile));
    } else {
      emit(UserProfileFailed());
    }
  }
}