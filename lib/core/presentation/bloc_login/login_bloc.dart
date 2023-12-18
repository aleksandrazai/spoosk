import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
import 'package:spoosk/core/data/RequestController.dart';
import 'package:spoosk/core/data/models/user_login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    RequestController requestController = RequestController();
    on<FilledFormEvent>((event, emit) async {
      try {
        final UserData? userData = await requestController.postUserLogin(
            userLogin: ApiConfigurate.userLogin,
            email: event.email,
            password: event.password);
        if (userData != null) {
          emit(LoginSuccessfull(userData: userData, id: userData.id));
        } else {
          emit(LoginError());
        }
      } catch (error) {
        print('Error in login: $error');
        emit(LoginError());
      }
    });
  }
}
