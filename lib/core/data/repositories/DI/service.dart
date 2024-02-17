import 'package:spoosk/core/data/DB/DBController_user_auth.dart';
import 'package:spoosk/core/data/models/user_login.dart';
import 'package:spoosk/core/presentation/features/user/profile/bloc_user_by_id/user_bloc.dart';

// Если надо создать где то AuthUseCase, то только делаем через SingletonAuthUseCase
// При выходе в поля  int? userId; String? userToken; записываем null

sealed class AuthUseCaseAbstract {
  static final DBControllerUserAuth dbControllerUserAuth =
      DBControllerUserAuth();
  int? userId;
  String? userToken;

  checkDB(UserProfileBloc userProfileBloc) async {
    final List<UserData>? userData = await _initDataBase();
    if (userData != null &&
        userData.isNotEmpty &&
        userData[0].id != null &&
        userData.isNotEmpty) {
      ("userData: ${userData[0].token}");
      userToken = userData[0].token;
      userId = userData[0].id;
    } else {
      userToken = null;
      userId = null;
    }
  }

  Future<List<UserData>?> _initDataBase() async {
    try {
      await dbControllerUserAuth.initDatabase();
      final result = await dbControllerUserAuth.getDataList();
      print("WORK: $result");
      return result;
    } catch (e) {
      return null;
    }
  }
}

class AuthUseCaseImpl extends AuthUseCaseAbstract {}

class SingletonAuthUseCase {
  static final SingletonAuthUseCase _instance =
      SingletonAuthUseCase._internal();

  factory SingletonAuthUseCase() {
    return _instance;
  }

  SingletonAuthUseCase._internal();

  final AuthUseCaseAbstract _authUseCase = AuthUseCaseImpl();

  AuthUseCaseAbstract get authUseCase => _authUseCase;
}
