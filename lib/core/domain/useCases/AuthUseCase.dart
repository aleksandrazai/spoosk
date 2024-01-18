import '../../data/DB/DBController_history_search.dart';
import '../../data/DB/DBController_user_auth.dart';
import '../../data/models/user_login.dart';
import '../../presentation/bloc_user_by_id/user_bloc.dart';

class AuthUseCase {
  static final DBController_user_auth _dbController_user_auth =
      DBController_user_auth();

  checkDB(UserProfileBloc userProfileBloc) async {
    try {
      final List<UserData> userData = await _initDataBase();
      print("AuthUseCase checkDB is OK: ${userData[0].id}");

      if (userData[0].id != null && userData.isNotEmpty) {
        userProfileBloc.add(GetUserInfo(userId: userData[0].id!));
      }
    } catch (e) {
      print("AuthUseCase checkDB: ${e}");
    }
  }

  Future<List<UserData>> _initDataBase() async {
    await _dbController_user_auth.initDatabase();
    final result = await _dbController_user_auth.getDataList();
    print("WORK: $result");
    return result;
  }
}
