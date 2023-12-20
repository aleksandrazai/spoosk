import 'package:spoosk/core/data/DB/DBController_history_search.dart';
import 'package:spoosk/core/data/DB/DBController_user_auth.dart';
import 'package:spoosk/core/data/models/user_login.dart';
import 'package:spoosk/core/presentation/bloc_user_by_id/user_bloc.dart';

class AuthUseCase {
  static DBController_user_auth dbController_user_auth =
      DBController_user_auth();
  DBController_history_search dbController_history_search =
      DBController_history_search();

  checkDB(UserProfileBloc userProfileBloc) async {
    // Проверяем бд на запись и сразу кидаем в блок если что то есть
    try {
      final List<UserData> userData = await _initDataBase();

      userProfileBloc.add(GetUserInfo(userId: userData[0].id));
    } catch (e) {
      throw e;
    }
  }

  Future<List<UserData>> _initDataBase() async {
    await dbController_user_auth.initDatabase();
    final result = await dbController_user_auth.getDataList();
    print("WORK: $result");
    return result;
  }
}
