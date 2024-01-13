import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/API/ApiConfig.dart';
import '../../data/API/RequestController.dart';
import '../../data/models/user_profile.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileLoaded? getUserInfo() {
    if (state is UserProfileLoaded) {
      return (state as UserProfileLoaded);
    }
    return null;
  }

  static UserProfileBloc bloc(BuildContext context) =>
      context.read<UserProfileBloc>();

  UserProfileBloc() : super(UserProfileInitial()) {
    RequestController requestController = RequestController();

    on<GetUserInfo>(
      (event, emit) async {
        final UserProfile? userProfile = await requestController.getUserProfile(
            getUserProfile: ApiConfigurateGet.getUserProfile, id: event.userId);
        if (userProfile != null) {
          emit(UserProfileLoaded(userProfile: userProfile));
        } else {
          emit(UserProfileFailed());
        }
      },
    );

    on<UserLogOut>(
      (event, emit) {
        emit(UserProfileInitial());
      },
    );
  }
}
