import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/API/ApiConfig.dart';
import 'package:spoosk/core/data/DB/DBController_user_auth.dart';

import '../../data/API/RequestController.dart';
import '../../data/models/user_profile.dart';

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
    // _initUserInfo();
    on<GetUserInfo>(_onGetUserInfo);
    on<UserLogOut>(_onUserLogout);
    on<EditUserProfile>(_onProfileEdit);
  }
  // void _initUserInfo() async {
  //   List<UserData> userInfo = await dbcontrollerUserAuth.getDataList();
  //   for (UserData user in userInfo) {
  //     userId = user.id;
  //   }
  //   if (userId != null) {
  //     add(GetUserInfo(userId: userId!));
  //   }
  // }
  int? getUserId() {
    if (state is UserProfileLoaded) {
      return (state as UserProfileLoaded).userProfile.id;
    }
    // If the state is not UserProfileLoaded or userId is not available, return null
    return null;
  }

  void _onGetUserInfo(
    GetUserInfo event,
    Emitter<UserProfileState> emit,
  ) async {
    print("_onGetUserInfo ${event.userId}");
    RequestController requestController = RequestController();
    // if (event.userId == null) {
    //   List<UserData> userInfo = await dbcontrollerUserAuth.getDataList();
    //   userToken = userInfo[0].token;
    //   for (UserData user in userInfo) {
    //     userId = user.id;
    //   }
    // }
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
