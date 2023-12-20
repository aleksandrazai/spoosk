import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
import 'package:spoosk/core/data/RequestController.dart';
import 'package:spoosk/core/data/models/user_profile.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
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
}
