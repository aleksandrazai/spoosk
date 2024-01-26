import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  int userId = 0;
  String userToken = '';

  void setUserId(int id) {
    userId = id;
    notifyListeners();
  }

  void setUserToken(String token) {
    userToken = token;
    notifyListeners();
  }
}
