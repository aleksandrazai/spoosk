// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
import 'package:spoosk/core/data/models/ResortById.dart';
import 'package:spoosk/core/data/models/regions.dart';
import 'package:spoosk/core/data/models/resorts.dart';
import 'package:spoosk/core/data/models/reviews.dart';
import 'package:spoosk/core/data/models/user_level.dart';
import 'package:spoosk/core/data/models/user_login.dart';
import 'package:spoosk/core/data/models/user_profile.dart';
import 'package:spoosk/core/data/models/user_register.dart';

class RequestController {
  final Dio _dio = Dio();

  RequestController();

  final String _url = dotenv.env['API_URL']!;

  Future<List<Result>?> getResortsAll({required getAllResorts}) async {
    try {
      final response =
          await _dio.get(_url + getAllResorts, options: ApiConfigurate.headers);

      final result = List<Result>.from(
        response.data['results'].map((x) {
          try {
            final result = Result.fromMap(x);
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

//Поиск курорта
  Future<List<Result>?> searchResort({
    required String text,
    required String searchResort,
  }) async {
    try {
      final response = await _dio.get('$_url$searchResort?search=$text',
          options: ApiConfigurate.headers);
      final result = List<Result>.from(
          response.data['results'].map((x) => Result.fromMap(x)));
      print('Filter Result: ${response.data}');
      return result;
    } catch (e) {
      print('Error in SearchAPI call: $e');
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
      final result = ResortById.fromMap(response.data);
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
          response.data['results'].map((x) => Result.fromMap(x)));
      return result;
    } catch (e) {
      print(e);
      Exception(e);
      return null;
    }
  }

  Future<List<Reviews>?> getReviews({
    required getReviews,
  }) async {
    try {
      print('URL Reviews: $_url$getReviews');
      final response =
          await _dio.get(_url + getReviews, options: ApiConfigurate.headers);

      final result = List<Reviews>.from(
          response.data['results'].map((x) => Reviews.fromJson(x)));
      print('Reviews Result: ${response.data}');
      return result;
    } catch (e) {
      print('Error in GetReviews call: $e');
      return null;
    }
  }

  Future<List<Reviews>?> getReviewsById({
    required getReviewsById,
    required id,
  }) async {
    try {
      print('URL Reviews: $_url$getReviewsById');
      final response = await _dio.get('$_url$getReviewsById$id/reviews/',
          options: ApiConfigurate.headers);
      final result = List<Reviews>.from(
          response.data['results'].map((x) => Reviews.fromJson(x)));
      print('ReviewsByID Result: ${response.data}');
      return result;
    } catch (e) {
      print('Error in GetReviewsByID call: $e');
      return null;
    }
  }

//авторизация пользователя
  Future<UserData?> postUserLogin({
    required userLogin,
    required String email,
    required String password,
  }) async {
    try {
      final requestData = {
        'email': email,
        'password': password,
      };

      print('Request Data: $requestData');
      print('$_url + $userLogin');
      final response = await _dio.post(_url + userLogin,
          data: requestData, options: ApiConfigPost.postHeaders);
      if (response.statusCode == 200) {
        final result = UserLogin.fromJson(response.data);
        print('UserLogin Result: ${response.data}');
        return result.data;
      }
    } on DioException catch (e) {
      print('Error in userLogin call: $e');
    }
    return null;
  }

//получение данных пользователя по ID
  Future<UserProfile?> getUserProfile({
    required getUserProfile,
    required id,
  }) async {
    try {
      print('URL UserProfile: $_url$getUserProfile$id');
      final response = await _dio.get('$_url$getUserProfile$id',
          options: ApiConfigurate.headers);
      final result = UserProfile.fromJson(response.data);
      print('UserProfile Result: ${response.data}');
      return result;
    } catch (e) {
      print('Error in UserProfile call: $e');
      return null;
    }
  }

//регистрация нового пользователя
  Future<UserRegister?> userRegister({
    required userRegister,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final requestData = {
        'first_name': name,
        'email': email,
        'password': password,
      };

      print('Request Data: $requestData');
      final response = await _dio.post(_url + userRegister,
          data: requestData, options: ApiConfigPost.postHeaders);

      final result = UserRegister.fromJson(response.data);
      print('UserRegister Result: ${response.data}');
      return result;
    } on DioException catch (e) {
      print('Error in Register call: ${e.message}');
      print('Error Details: ${e.response?.toString()}');
      if (e.response?.statusCode == 400) {
        final errorData = e.response?.statusMessage;
        throw RegistrationException(errorData!);
      }
    }
    return null;
  }

//верификация пользователя по коду
  Future<UserData?> verifyCode({
    required verifyCode,
    required code,
    required id,
  }) async {
    try {
      final requestData = {
        'code': code,
      };

      print('Request data: $requestData, id: $id');

      final response = await _dio.post('$_url$verifyCode$id/verify_code/',
          data: requestData, options: ApiConfigPost.postHeaders);

      final result = UserLogin.fromJson(response.data);
      print('VerifyCode Result: ${response.data}');
      return result.data;
    } on DioException catch (e) {
      print('Error in UserProfile call: $e');
      return null;
    }
  }

  //cброс пароля
  Future<UserData?> passwordReset({
    required passwordReset,
    required String email,
  }) async {
    try {
      final requestData = {
        'email': email,
      };
      print('Request Data: $requestData');
      final response = await _dio.post(_url + passwordReset,
          data: requestData, options: ApiConfigPost.postHeaders);
      if (response.statusCode == 200) {
        final result = UserLogin.fromJson(response.data);
        print('UserLogin Result: ${response.data}');
        return result.data;
      }
    } on DioException catch (e) {
      print('Error in userLogin call: $e');
    }
    return null;
  }

//установить новый пароль
  Future<UserLogin?> setPassword({
    required setPassword,
    required id,
    required String password,
  }) async {
    try {
      final requestData = {
        'password': password,
      };
      print('Request Data: $requestData, $id');
      final response = await _dio.post('$_url$setPassword$id/change_password/',
          data: requestData, options: ApiConfigPost.postHeaders);
      if (response.statusCode == 200) {
        final result = UserLogin.fromJson(response.data);
        print('New Password Result: ${response.data}');
        return result;
      }
    } on DioException catch (e) {
      print('Error in userLogin call: $e');
    }
    return null;
  }

//редактирование профиля
  Future<UserProfile?> editProfile({
    required editProfile,
    required id,
    required String firstName,
    required String lastName,
    required String nickName,
    required String country,
    required String city,
    // required Object avatar,
  }) async {
    try {
      final requestData = {
        if (firstName.isNotEmpty) "first_name": firstName,
        if (lastName.isNotEmpty) "last_name": lastName,
        if (nickName.isNotEmpty) "nickname": nickName,
        if (city.isNotEmpty) "city": city,
        if (country.isNotEmpty) "country": country,
        // "avatar": avatar,
      };

      print('Request Data: $requestData, $id');
      print('$_url$editProfile$id');
      final response = await _dio.patch('$_url$editProfile$id/',
          data: requestData, options: ApiConfigPatch.patchHeaders);
      if (response.statusCode == 200) {
        final result = UserProfile.fromJson(response.data['data']);
        print('New Profile: ${response.data}');
        return result;
      }
    } on DioException catch (e) {
      print('Error in editProfile call: $e');
    }
    return null;
  }
}

class RegistrationException {
  final String message;

  RegistrationException(this.message);

  @override
  String toString() => 'RegistrationException: $message';
}
