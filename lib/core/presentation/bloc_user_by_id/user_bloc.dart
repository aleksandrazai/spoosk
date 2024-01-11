import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
import 'package:spoosk/core/data/DB/DBController_user_auth.dart';
import 'package:spoosk/core/data/RequestController.dart';
import 'package:spoosk/core/data/models/user_login.dart';
import 'package:spoosk/core/data/models/user_profile.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  int? userId;
  final DBController_user_auth dbcontrollerUserAuth = DBController_user_auth();
  UserProfileBloc() : super(UserProfileInitial()) {
    _initUserInfo();
    RequestController requestController = RequestController();
    on<GetUserInfo>(
      (event, emit) async {
        final UserProfile? userProfile = await requestController.getUserProfile(
            getUserProfile: ApiConfigurate.getUserProfile, id: event.userId);
        if (userProfile != null) {
          userId = event.userId;
          emit(UserProfileLoaded(userProfile: userProfile));
        } else {
          emit(UserProfileFailed());
        }
      },
    );

    on<UserLogOut>(
      (event, emit) {
        dbcontrollerUserAuth.delete(userId!);
        emit(UserProfileInitial());
      },
    );
  }
  void _initUserInfo() async {
    List<UserData> userInfo = await dbcontrollerUserAuth.getDataList();
    for (UserData user in userInfo) {
      userId = user.id;
    }
    if (userId != null) {
      add(GetUserInfo(userId: userId!));
    }
  }
}
