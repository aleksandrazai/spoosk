// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spoosk/core/data/API/ApiConfig.dart';
import 'package:spoosk/core/data/models/ResortById.dart';
import 'package:spoosk/core/data/models/filter_button_values.dart';
import 'package:spoosk/core/data/models/regions.dart';
import 'package:spoosk/core/data/models/resorts.dart';
import 'package:spoosk/core/data/models/reviews.dart';
import 'package:spoosk/core/data/models/test_reviews.dart';
import 'package:spoosk/core/data/models/user_level.dart';
import 'package:spoosk/core/data/models/user_login.dart';
import 'package:spoosk/core/data/models/user_profile.dart';
import 'package:spoosk/core/data/models/user_register.dart';
import 'package:spoosk/core/data/repositories/DI/service.dart';

class RequestController {
  final Dio _dio = Dio();
  SingletonAuthUseCase singletonAuthUseCase = SingletonAuthUseCase();
  late String _baseUrl;

  RequestController() {
    _baseUrl = dotenv.env['API_URL']!;
  }

  Future<List<Resort>?> getResortsAll(String? userToken) async {
    try {
      final Response<Map<String, dynamic>> response = await _dio.request(
        _baseUrl + ApiConfigUserGet.getAllResorts,
        options: ApiConfigUserGet.userHeaders(
            userToken: singletonAuthUseCase.authUseCase.userToken ?? ''),
      );

      final Map<String, dynamic>? responseData = response.data;

      if (responseData != null) {
        final Resorts resorts = Resorts.fromMap(responseData);
        return resorts.results;
      } else {
        return null;
      }
    } catch (e) {
      print('Error getResortsAll: $e');
      return null;
    }
  }

//Поиск курорта
  Future<List<Resort>?> searchResort({
    required String text,
    required String searchResort,
  }) async {
    try {
      final response = await _dio.get('$_baseUrl$searchResort?search=$text',
          options: ApiConfigurateGet.headers);
      final result = List<Resort>.from(
          response.data['results'].map((x) => Resort.fromMap(x)));
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
  Future<List<Resort>?> getMainFilter({
    required List<String> resort_region,
    required List<String> resort_month,
    required List<String> resort_level,
    required List<String> advancedFilter,
    required String slider,
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
      final String advancedSelected = advancedFilter.isNotEmpty
          ? GroupButtonMappings.mapListToParameters(advancedFilter)
              .values
              .join('&')
          : '';
      final String sliderSelected =
          slider != '0' ? 'airport_distance=$slider' : '';

      final String parameters = [
        regionsSelected,
        monthsSelected,
        levelsSelected,
        advancedSelected,
        sliderSelected,
      ].where((param) => param.isNotEmpty).join('&');

      final String url =
          '$_baseUrl${ApiConfigurateGet.mainFilter}${parameters.isNotEmpty ? '?' : ''}$parameters';
      print('Filter Request: $url');

      final response = await _dio.get(url, options: ApiConfigurateGet.headers);

      final result = List<Resort>.from(
          response.data['results'].map((x) => Resort.fromMap(x)));
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
        final UserLogin result = UserLogin.fromJson(response.data);
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
      if (response.statusCode == 200) {
        final result = UserLogin.fromJson(response.data);
        print('VerifyCode Result: ${response.data}');
        return result.data;
      }
    } on DioException catch (e) {
      print('Error in UserProfile call: $e');
      return null;
    }
    return null;
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
    required String userToken,
  }) async {
    try {
      final requestData = {
        'password': password,
      };
      print('Request Data: $requestData, $id');
      final response = await _dio.post(
          _baseUrl + ApiConfigResetPassword.setPassword(id: id),
          data: requestData,
          options:
              ApiConfigResetPassword.getHeaders(userTokenPassword: userToken));
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

  Future<void> deleteReviews(int id, String userToken) async {
    print("$_baseUrl${ApiConfigDelete.deleteReviews}$id/");
    try {
      final response = await _dio.request(
          "$_baseUrl${ApiConfigDelete.deleteReviews}$id/",
          options: ApiConfigDelete.deleteHeaders(userToken: userToken));
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
    required String userToken,
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
        "last_name": lastName,
        "nickname": nickName,
        "city": city,
        "country": country,
        // "avatar": avatar,
      };

      print('Request Data: $requestData, $id');
      print('$_baseUrl$editProfile$id');
      final response = await _dio.patch('$_baseUrl$editProfile$id/',
          data: requestData,
          options: ApiConfigPatch.patchHeaders(userToken: userToken));
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

  Future<Review?> postReviews(TestReviews data, String userToken) async {
    try {
      FormData formData = FormData();

      try {
        for (int i = 0; i < data.images.length; i++) {
          String filePath = data.images[i].path;
          String fileName = filePath.split('/').last;
          MultipartFile file = await MultipartFile.fromFile(
            filePath,
            filename: fileName,
          );
          formData.files.add(MapEntry('images', file));
        }
      } catch (e) {
        print("Error uploading image: $e");
      }
      formData.fields.add(MapEntry('resort', data.resort));
      formData.fields.add(MapEntry('text', data.text));
      formData.fields.add(MapEntry('rating', data.rating.toString()));

      // Добавляем изображения в FormData

      print(formData);
      final response = await _dio.post(
        _baseUrl + ApiConfigUserPost.postReviews,
        options: ApiConfigUserPost.userHeaders(userToken: userToken),
        data: formData,
      );
      print(response.data);
      print(response.statusCode);
    } on DioException catch (e) {
      print('postReviews ERROR $e');
    }
    return null;
  }

//запрос на редактирование отзывов
  Future<Review?> editReviews(
      TestReviews data, int id, String userToken) async {
    try {
      FormData formData = FormData();
      formData.fields.add(MapEntry('resort', data.resort));
      formData.fields.add(MapEntry('text', data.text));
      formData.fields.add(MapEntry('rating', data.rating.toString()));
      print(formData);
      final response = await _dio.patch(
        '$_baseUrl${ApiConfigPatch.editReview}$id/',
        options: ApiConfigPatch.patchHeaders(userToken: userToken),
        data: formData,
      );
      print(response.data);
      print(response.statusCode);
    } on DioException catch (e) {
      print('editReviews ERROR $e');
    }
    return null;
  }

  Future<bool?> getAddToFavorites(
      {required String resortId, required String userToken}) async {
    try {
      final response = await _dio.request(
        _baseUrl + ApiConfigUserGet.getAddToFavorites(resortId: resortId),
        options: ApiConfigUserGet.userHeaders(userToken: userToken),
      );
      if (response.statusCode == 200) {
        print(response.data);
        return true;
      }
    } catch (e) {
      print("ERROR getAddToFavorites: $e");
    }
    return null;
  }

  Future<List<Resort>?> getAddedFavorites(
      {required int userId, required String userToken}) async {
    print("getAddedFavorites WORK");
    try {
      final response = await _dio.request(
        _baseUrl + ApiConfigUserGet.getAddedFavorites(userId: userId),
        options: ApiConfigUserGet.userHeaders(userToken: userToken),
      );
      final List<Resort> result = List<Resort>.from(
        response.data['results'].map((x) {
          try {
            final result = Resort.fromMap(x);
            return result;
          } catch (e) {
            print('Error mapping result: $e');
            return null;
          }
        }),
      );
      return result;
    } catch (e) {
      print("ERROR getAddedFavorites: $e, userId: $userId ");
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
