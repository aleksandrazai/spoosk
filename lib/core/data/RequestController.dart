// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
import 'package:spoosk/core/data/models/ResortById.dart';
import 'package:spoosk/core/data/models/regions.dart';
import 'package:spoosk/core/data/models/resorts.dart';

class RequestController {
  final Dio _dio = Dio();
  RequestController();
  // Если вдруг появится тестовый сервер
  //  final bool _TEST_SEVER = false;
  // final String _url = _TEST_SEVER ? *тестовый сервер* : "https://spoosk.pnpl.tech/";
  final String _url = "https://spoosk.pnpl.tech/";

  Future<List<Resorts>?> getResortsAll({required getAllResorts}) async {
    try {
      final response =
          await _dio.get(_url + getAllResorts, options: ApiConfigurate.headers);
      final result =
          List<Resorts>.from(response.data.map((x) => Resorts.fromJson(x)));
      return result;
    } catch (e) {
      print(e);
      Exception(e);
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
      return result;
    } catch (e) {
      print(e);
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

  //Main filter c множественным выбором
  Future<List<Resorts>?> getMainFilter({
    required List<String> resort_region,
    required List<String> resort_month,
    required List<String> resort_level,
  }) async {
    try {
      final String regionsSelected = resort_region.join(',');
      final String monthsSelected = resort_month.join(',');
      final String levelsSelected = resort_level.join(',');

      final response = await _dio.get(
          '$_url${ApiConfigurate.mainFilter}?resort_region=$regionsSelected&resort_month=$monthsSelected&resort_level=$levelsSelected',
          options: ApiConfigurate.headers);
      final result =
          List<Resorts>.from(response.data.map((x) => Resorts.fromJson(x)));
      return result;
    } catch (e) {
      print(e);
      Exception(e);
      return null;
    }
  }
}
