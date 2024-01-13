// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spoosk/core/data/API/ApiConfig.dart';
import 'package:spoosk/core/data/models/ResortById.dart';
import 'package:spoosk/core/data/models/regions.dart';
import 'package:spoosk/core/data/models/resorts.dart';
import 'package:spoosk/core/data/models/reviewPhoto.dart';
import 'package:spoosk/core/data/models/reviews.dart';
import 'package:spoosk/core/data/models/user_level.dart';
import 'package:spoosk/core/data/models/user_login.dart';
import 'package:spoosk/core/data/models/user_profile.dart';
import 'package:spoosk/core/data/models/user_register.dart';

class RequestController {
  final Dio _dio = Dio();

  RequestController();

  final String _baseUrl = dotenv.env['API_URL']!;

  Future<List<Result>?> getResortsAll({required getAllResorts}) async {
    try {
      final response = await _dio.get(_baseUrl + getAllResorts,
          options: ApiConfigurateGet.headers);

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
      final response = await _dio.get('$_baseUrl$searchResort?search=$text',
          options: ApiConfigurateGet.headers);
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
    print("URL ${_baseUrl + getResotrsById + id}");
    try {
      final response = await _dio.get(_baseUrl + getResotrsById + id,
          options: ApiConfigurateGet.headers);
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
      final response = await _dio.get(_baseUrl + getAllRegions,
          options: ApiConfigurateGet.headers);
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
          '$_baseUrl${ApiConfigurateGet.mainFilter}${parameters.isNotEmpty ? '?' : ''}$parameters';
      print('Filter Request: $url');

      final response = await _dio.get(url, options: ApiConfigurateGet.headers);

      final result = List<Result>.from(
          response.data['results'].map((x) => Result.fromMap(x)));
      return result;
    } catch (e) {
      print(e);
      Exception(e);
      return null;
    }
  }

  Future<List<Review>?> getReviews({
    required getReviews,
  }) async {
    try {
      print('URL Reviews: $_baseUrl$getReviews');
      final response = await _dio.get(_baseUrl + getReviews,
          options: ApiConfigurateGet.headers);

      final result = List<Review>.from(
          response.data['results'].map((x) => Review.fromJson(x)));
      print('Reviews Result: ${response.data}');
      return result;
    } catch (e) {
      print('Error in GetReviews call: $e');
      return null;
    }
  }

  Future<List<Review>?> getReviewsById({
    required getReviewsById,
    required id,
  }) async {
    try {
      print('URL Reviews: $_baseUrl$getReviewsById');
      final response = await _dio.get('$_baseUrl$getReviewsById$id/reviews/',
          options: ApiConfigurateGet.headers);
      final result = List<Review>.from(
          response.data['results'].map((x) => Review.fromJson(x)));
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
      print('$_baseUrl + $userLogin');
      final response = await _dio.post(_baseUrl + userLogin,
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
      print('URL UserProfile: $_baseUrl$getUserProfile$id');
      final response = await _dio.get('$_baseUrl$getUserProfile$id',
          options: ApiConfigurateGet.headers);
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
      final response = await _dio.post(_baseUrl + userRegister,
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

      final response = await _dio.post('$_baseUrl$verifyCode$id/verify_code/',
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
      final response = await _dio.post(_baseUrl + passwordReset,
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
      final response = await _dio.post(
          '$_baseUrl$setPassword$id/change_password/',
          data: requestData,
          options: ApiConfigPost.postHeaders);
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

  Future<Reviews?> getReviewsHome() async {
    print("getReviewsHome");
    try {
      final response = await _dio.get(
          _baseUrl + ApiConfigurateGet.getReviewsHomeScreen,
          options: ApiConfigurateGet.headers);
      if (response.statusCode == 200) {
        final result = Reviews.fromJson(response.data);
        return result;
      }
    } catch (e) {
      print('getReviewsHome ERROR $e');
    }
    return null;
  }

  Future<Review?> postReviews(Review data) async {
    try {
      final response = await _dio.request(
        _baseUrl + ApiConfigPost.postReviews,
        options: ApiConfigPost.postHeaders,
        data: data.toJson(),
      );
      print(' post reviews ${response.data}');
    } catch (e) {
      print('postReviews ERROR $e');
    }
    return null;
  }

  Future<void> deleteReviews(int id) async {
    print("$_baseUrl${ApiConfigDelete.deleteReviews}$id/");
    try {
      final response = await _dio.request(
          "$_baseUrl${ApiConfigDelete.deleteReviews}$id/",
          options: ApiConfigDelete.deleteHeaders);
      print(response.data);
    } catch (e) {
      print('deleteReviews ERROR $e');
    }
  }

  //отзыв пользователя
  Future<Reviews?> getUserReviews(
      {required int id, required getUserReviews}) async {
    print('$_baseUrl$getUserReviews$id/reviews/');
    try {
      final response = await _dio.get('$_baseUrl$getUserReviews$id/reviews/',
          options: ApiConfigurateGet.headers);
      if (response.statusCode == 200) {
        final result = Reviews.fromJson(response.data);
        print('User Reviews result: ${response.data}');
        return result;
      }
    } catch (e) {
      print('getReviewsUser ERROR $e');
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
      print('$_baseUrl$editProfile$id');
      final response = await _dio.patch('$_baseUrl$editProfile$id/',
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
