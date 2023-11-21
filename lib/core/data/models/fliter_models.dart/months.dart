import 'package:flutter/material.dart';

class SelectedMonthsModel extends ChangeNotifier {
  final List<String> _selectedMonths = [];

  List<String> get selectedMonths => _selectedMonths;

  bool isSelectedMonth(String value) {
    return _selectedMonths.contains(value);
  }

  void toggleSelectedMonth(String value) {
    if (_selectedMonths.contains(value)) {
      _selectedMonths.remove(value);
    } else {
      _selectedMonths.add(value);
    }
    notifyListeners();
  }
}
