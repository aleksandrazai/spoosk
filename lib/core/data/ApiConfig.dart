import 'package:dio/dio.dart';

class ApiConfigurate {
  static final Options headers = Options(headers: {
    "Authorization": 'Token 73db87ee63c266cf0455fbb4ec891580aab3406b'
  });

  static String getResotrs = 'api/resorts/';
  static String getResotrsById = 'api/resorts/';
}
