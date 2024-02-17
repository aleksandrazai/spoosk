import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String token = dotenv.env['API-key']!;

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
  static Options deleteHeaders({required userToken}) {
    return Options(method: "DELETE", headers: {
      'accept': 'application/json',
      "API-key": token,
      "Authorization": "Token $userToken"
    });
  }

  static String deleteReviews = 'api/reviews/';
}

class ApiConfigPatch {
  static Options patchHeaders({required String userToken}) {
    return Options(
        method: "PATCH",
        headers: {"API-key": token, "Authorization": "Token $userToken"});
  }

  static String editProfile = 'api/users/';
  static String editReview = 'api/reviews/';
}

class ApiConfigUserPost {
  static Options userHeaders({required String userToken}) {
    return Options(
        method: "POST",
        headers: {"API-key": token, "Authorization": "Token $userToken"});
  }

  static String postReviews = 'api/reviews/';
}

class ApiConfigUserGet {
  static Options userHeaders({required String? userToken}) {
    Map<String, String> headers = {
      "API-key": token,
    };

    if (userToken != null && userToken.isNotEmpty) {
      headers["Authorization"] = "Token $userToken";
    }
    return Options(method: "GET", headers: headers);
  }

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

  static String getAllResorts = 'api/resorts/';
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
