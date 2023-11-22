import 'package:flutter/material.dart';

class SelectedMonthsModel extends ChangeNotifier {
  final List<String> selectedMonths = [];

  bool isSelectedMonth(String value) {
    return selectedMonths.contains(value);
  }

  void toggleSelectedMonth(String value) {
    if (selectedMonths.contains(value)) {
      selectedMonths.remove(value);
    } else {
      selectedMonths.add(value);
    }
    notifyListeners();
  }
}
