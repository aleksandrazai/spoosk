import 'package:dio/dio.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
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
      Exception(e);
      return null;
    }
  }

  //Первый параметр принимает id *пример: Roza_hutor* второй параметр это url запроса
  Future<Resorts?> getResortsById(
      {required id, required getResotrsById}) async {
    try {
      final response = await _dio.get(_url + getResotrsById + id,
          options: ApiConfigurate.headers);
      final result = response.data.map((x) => Resorts.fromJson(x));
      return result;
    } catch (e) {
      Exception(e);
      return null;
    }
  }
}