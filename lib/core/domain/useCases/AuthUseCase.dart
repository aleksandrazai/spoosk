import 'package:spoosk/core/data/API/ApiConfig.dart';

import '../../data/DB/DBController_user_auth.dart';
import '../../data/models/user_login.dart';
import '../../presentation/bloc_user_by_id/user_bloc.dart';

class AuthUseCase {
  static final DBControllerUserAuth dbControllerUserAuth =
      DBControllerUserAuth();
  int? userId;
  String? userToken;

  checkDB(UserProfileBloc userProfileBloc) async {
    try {
      final List<UserData> userData = await _initDataBase();
      print("AuthUseCase checkDB is OK: ${userData[0].id}");

      if (userData[0].id != null && userData.isNotEmpty) {
        userToken = userData[0].token;
        userId = userData[0].id;
        userProfileBloc.add(GetUserInfo(userId: userId!));
        UserTokenConfig.setToken(userToken!);
      }
    } catch (e) {
      print("AuthUseCase checkDB: ${e}");
    }
  }

  Future<List<UserData>> _initDataBase() async {
    await dbControllerUserAuth.initDatabase();
    final result = await dbControllerUserAuth.getDataList();
    print("WORK: $result");
    return result;
  }
}
