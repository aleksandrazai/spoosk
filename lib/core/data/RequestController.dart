// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
import 'package:spoosk/core/data/models/ResortById.dart';
import 'package:spoosk/core/data/models/regions.dart';
import 'package:spoosk/core/data/models/resorts.dart';
import 'package:spoosk/core/data/models/user_level.dart';

class RequestController {
  final Dio _dio = Dio();
  RequestController();
  // Если вдруг появится тестовый сервер
  //  final bool _TEST_SEVER = false;
  // final String _url = _TEST_SEVER ? *тестовый сервер* : "https://spoosk.pnpl.tech/";
  final String _url = "https://spoosk.pnpl.tech/";

  Future<List<Result>?> getResortsAll({required getAllResorts}) async {
    try {
      final response =
          await _dio.get(_url + getAllResorts, options: ApiConfigurate.headers);

      final result = List<Result>.from(
        response.data['results'].map((x) {
          try {
            final result = Result.fromJson(x);
            return result;
          } catch (e) {
            print('Error mapping result: $e');
            return null;
          }
        }),
      );

      return result;
    } catch (e) {
      print('Error in API call: $e');
      return null;
    }
  }

  //Первый параметр принимает id *пример: Roza_hutor* второй параметр это url запроса
  Future<ResortById?> getResortsById({
    required id,
    required String getResotrsById,
  }) async {
    print("URL ${_url + getResotrsById + id}");
    try {
      final response = await _dio.get(_url + getResotrsById + id,
          options: ApiConfigurate.headers);
      final result = ResortById.fromJson(response.data);
      print('ResortByID: ${response.data}');
      return result;
    } catch (e) {
      print('Error in API call: $e');
      return null;
    }
  }

  //Get regions
  Future<List<Regions>?> getRegionsAll({required getAllRegions}) async {
    try {
      final response =
          await _dio.get(_url + getAllRegions, options: ApiConfigurate.headers);
      final result =
          List<Regions>.from(response.data.map((x) => Regions.fromJson(x)));
      return result;
    } catch (e) {
      print(e);
      Exception(e);
      return null;
    }
  }

  //Filter c множественным выбором
  Future<List<Result>?> getMainFilter({
    required List<String> resort_region,
    required List<String> resort_month,
    required List<String> resort_level,
  }) async {
    try {
      final String regionsSelected = resort_region.isNotEmpty
          ? 'resort_region=${resort_region.join(',')}'
          : '';
      final String monthsSelected = resort_month.isNotEmpty
          ? 'resort_month=${resort_month.join(',')}'
          : '';
      final String levelsSelected = resort_level.isNotEmpty
          ? 'resort_level=${UserLevel.mapLevelsToColors(resort_level).join(',')}'
          : '';

      final String parameters = [
        regionsSelected,
        monthsSelected,
        levelsSelected
      ].where((param) => param.isNotEmpty).join('&');

      final String url =
          '$_url${ApiConfigurate.mainFilter}${parameters.isNotEmpty ? '?' : ''}$parameters';
      print('Filter Request: $url');

      final response = await _dio.get(url, options: ApiConfigurate.headers);

      final result = List<Result>.from(
          response.data['results'].map((x) => Result.fromJson(x)));
      return result;
    } catch (e) {
      print(e);
      Exception(e);
      return null;
    }
  }
}
