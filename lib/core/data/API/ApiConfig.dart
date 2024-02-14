import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spoosk/core/domain/useCases/setUserToken.dart';

final String token = dotenv.env['API-key']!;
final String userToken = "Token ${UserTokenConfig.token}";
// ------ Read me ------
// userToken имеет структуру - "Token l1k23jlkj4lk3jk54yijyi5jyoi5"

class ApiConfigurateGet {
  static final Options headers = Options(method: "GET", headers: {
    "API-key": token,
  });

  static String getAllResorts = 'api/resorts/';
  static String getResotrsById = 'api/resorts/';
  static String getAllRegions = 'api/resorts/regions';
  static String mainFilter = 'api/resorts/filter';
  static String searchResort = 'api/resorts/';
  static String getReviews = 'api/reviews/';
  static String getReviewsById = 'api/resorts/';
  static String getUserProfile = 'api/users/';
  static String getReviewsHomeScreen = 'api/reviews/';
  static String getUserReviews = 'api/users/';
}

class ApiConfigPost {
  static final Options postHeaders = Options(method: "POST", headers: {
    "API-key": token,
  });

  static String userRegister = 'api/users/';
  static String verifyCode = 'api/users/';
  static String userLogin = 'api/users/login/';
  static String passwordReset = 'api/users/reset_password_request/';
}

class ApiConfigDelete {
  static final Options deleteHeaders = Options(method: "DELETE", headers: {
    'accept': 'application/json',
    "API-key": token,
    "Authorization": userToken,
  });
  static String deleteReviews = 'api/reviews/';
}

class ApiConfigPatch {
  static final Options patchHeaders = Options(method: "PATCH", headers: {
    "API-key": token,
    "Authorization": userToken,
  });

  static String editProfile = 'api/users/';
  static String editReview = 'api/reviews/';
}

class ApiConfigUserPost {
  static final Options userHeaders = Options(method: "POST", headers: {
    "API-key": token,
    "Authorization": userToken,
  });

  static String postReviews = 'api/reviews/';
}

class ApiConfigUserGet {
  static final Options headers = Options(method: "GET", headers: {
    "API-key": token,
    "Authorization": userToken,
  });
  // Добавляет/ удаляет избранные
  static String Function({required String resortId}) getAddToFavorites =
      ({required String resortId}) {
    return 'api/resorts/$resortId/add_to_favorites/';
  };
// Получает список избронных у пользователя
  static String Function({required int userId}) getAddedFavorites =
      ({required int userId}) {
    return 'api/users/$userId/favorites/';
  };
}

class ApiConfigResetPassword {
  static Options getHeaders({required String userTokenPassword}) {
    return Options(
      method: "POST",
      headers: {
        "API-key": token,
        "Authorization": "Token $userTokenPassword",
      },
    );
  }

  static String Function({required int id}) setPassword = ({required int id}) {
    return 'api/users/$id/change_password/';
  };
}
