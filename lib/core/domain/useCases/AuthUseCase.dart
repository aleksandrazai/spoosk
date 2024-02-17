import 'package:spoosk/core/presentation/features/user/profile/bloc_user_by_id/user_bloc.dart';
import '../../data/DB/DBController_user_auth.dart';
import '../../data/models/user_login.dart';

class AuthUseCase {
  static final DBControllerUserAuth dbControllerUserAuth =
      DBControllerUserAuth();
  int? userId;
  String? userToken;

  checkDB(UserProfileBloc userProfileBloc) async {
    final List<UserData> userData = await _initDataBase();
    print("AuthUseCase checkDB is OK: ${userData[0].id}");
    if (userData[0].id != null && userData.isNotEmpty) {
      userToken = userData[0].token;
      userId = userData[0].id;
    } else {
      userToken = null;
      userId = null;
    }
  }

  Future<List<UserData>> _initDataBase() async {
    await dbControllerUserAuth.initDatabase();
    final result = await dbControllerUserAuth.getDataList();
    print("WORK: $result");
    return result;
  }
}
