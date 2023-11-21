import 'package:flutter/material.dart';

class SelectedLevelsModel extends ChangeNotifier {
  final List<String> _selectedLevels = [];

  List<String> get selectedLevels => _selectedLevels;

  bool isSelectedLevel(String value) {
    return _selectedLevels.contains(value);
  }

  void toggleSelectedLevel(String value) {
    if (_selectedLevels.contains(value)) {
      _selectedLevels.remove(value);
    } else {
      _selectedLevels.add(value);
    }
    notifyListeners();
  }
}
