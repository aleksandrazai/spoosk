import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  int userId = 0;

  void setUserId(int id) {
    userId = id;
    notifyListeners();
  }
}
