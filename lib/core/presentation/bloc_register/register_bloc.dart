import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
import 'package:spoosk/core/data/RequestController.dart';
import 'package:spoosk/core/data/models/user_profile.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  // DBController_user_auth dbController_user_auth = DBController_user_auth();
  // DBController_history_search dbController_history_search =
  //     DBController_history_search();

  RegisterBloc() : super(RegisterInitial()) {
    RequestController requestController = RequestController();
    on<RegisterFormFilled>((event, emit) async {
      try {
        final UserProfile? userProfile = await requestController.userRegister(
            email: event.email,
            password: event.password,
            name: event.name,
            userRegister: ApiConfigurate.postHeaders);
        if (userProfile != null) {
          // await initDataBase(userData: userData);
          emit(RegisterSuccessfull(
              userProfile: userProfile, id: userProfile.id));
        } else {
          emit(RegisterFailed());
        }
      } catch (error) {
        print('Error in register: $error');
        emit(RegisterError());
      }
    });
  }

  // Future<void> initDataBase({UserData? userData}) async {
  //   // final List<UserData> data = await dbController_user_auth.getDataList();
  //   // print(data);
  //   await dbController_user_auth
  //       .insert(UserData(token: userData!.token, id: userData.id));
  // }
}
