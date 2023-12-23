import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
import 'package:spoosk/core/data/RequestController.dart';
import 'package:spoosk/core/data/models/user_profile.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileInitial()) {
    RequestController requestController = RequestController();
    on<GetUserInfo>(
      (event, emit) async {
        final UserProfile? userProfile = await requestController.getUserProfile(
            getUserProfile: ApiConfigurate.getUserProfile, id: event.userId);
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
