import 'package:dio/dio.dart';

class ApiConfigurate {
  static final Options headers = Options(method: "GET", headers: {
    "Authorization": 'Token 73db87ee63c266cf0455fbb4ec891580aab3406b',
  });

  static String getAllResorts = 'api/resorts/';
  static String getResotrsById = 'api/resorts/';
  static String getAllRegions = 'api/resorts/regions';
  static String mainFilter = 'api/resorts/filter';
  static String searchResort = 'api/resorts/';
  static String getReviews = 'api/reviews/';
}
