import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
import 'package:spoosk/core/data/DB/DBController_history_search.dart';
import 'package:spoosk/core/data/DB/DBController_user_auth.dart';
import 'package:spoosk/core/data/RequestController.dart';
import 'package:spoosk/core/data/models/UserAuth.dart';
import 'package:spoosk/core/data/models/user_login.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  DBController_user_auth dbController_user_auth = DBController_user_auth();
  DBController_history_search dbController_history_search =
      DBController_history_search();

  LoginBloc() : super(LoginInitial()) {
    RequestController requestController = RequestController();
    on<FilledFormEvent>((event, emit) async {
      final UserData? userData = await requestController.postUserLogin(
          userLogin: ApiConfigurate.userLogin,
          email: event.email,
          password: event.password);
      if (userData != null) {
        await initDataBase(userData: userData);
        emit(LoginSuccessfull(userData: userData, id: userData.id));
      }
    });
  }

  Future<void> initDataBase({UserData? userData}) async {
    // final List<UserData> data = await dbController_user_auth.getDataList();
    // print(data);
    await dbController_user_auth
        .insert(UserData(token: userData!.token, id: userData.id));
  }
}
