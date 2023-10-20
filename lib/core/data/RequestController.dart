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

  Future<List<Resorts>> getData(apiPath) async {
    final response =
        await _dio.get(_url + apiPath, options: ApiConfigurate.headers);
    final result =
        List<Resorts>.from(response.data.map((x) => Resorts.fromJson(x)));
    return result;
  }
}
