import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String token = dotenv.env['API_TOKEN']!;

class ApiConfigurate {
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
}
