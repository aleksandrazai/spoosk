import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String token = dotenv.env['API_TOKEN']!;

class ApiConfigurateGet {
  static final Options headers = Options(method: "GET", headers: {
    "Authorization": token,
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
    "Authorization": token,
  });

  static String userRegister = 'api/users/';
  static String verifyCode = 'api/users/';
  static String userLogin = 'api/users/login/';
  static String passwordReset = 'api/users/reset_password_request/';
  static String setPassword = 'api/users/';
  static String postReviews = 'api/reviews/';
}

class ApiConfigDelete {
  static final Options deleteHeaders = Options(method: "DELETE", headers: {
    'accept': 'application/json',
    "Authorization": token,
  });
  static String deleteReviews = 'api/reviews/';
}

class ApiConfigPatch {
  static final Options patchHeaders = Options(method: "PATCH", headers: {
    "Authorization": token,
  });

  static String editProfile = 'api/users/';
}
