import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/API/ApiConfig.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/DB/DBController_history_search.dart';
import 'package:spoosk/core/data/DB/DBController_user_auth.dart';
import 'package:spoosk/core/domain/useCases/setUserToken.dart';

import '../../data/models/user_login.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  DBControllerUserAuth dbController_user_auth = DBControllerUserAuth();
  DBController_history_search dbController_history_search =
      DBController_history_search();

  LoginBloc() : super(LoginInitial()) {
    RequestController requestController = RequestController();
    on<FilledFormEvent>((event, emit) async {
      try {
        final UserData? userData = await requestController.postUserLogin(
            email: event.email,
            password: event.password,
            userLogin: ApiConfigPost.userLogin);
        if (userData != null) {
          await initDataBase(userData: userData);
          emit(LoginSuccessfull(userData: userData, id: userData.id!));
        } else {
          emit(LoginFailed());
        }
      } catch (error) {
        print('Error in login: $error');
        emit(LoginError());
      }
    });
  }

  Future<void> initDataBase({UserData? userData}) async {
    await dbController_user_auth
        .insert(UserData(token: userData!.token, id: userData.id));
    UserTokenConfig.setToken(userData.token!);
  }
}
