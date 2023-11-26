import 'package:flutter/material.dart';

class SelectedLevelsModel extends ChangeNotifier {
  final List<String> selectedLevels = [];

  bool isSelectedLevel(String value) {
    return selectedLevels.contains(value);
  }

  void toggleSelectedLevel(String value) {
    if (selectedLevels.contains(value)) {
      selectedLevels.remove(value);
    } else {
      selectedLevels.add(value);
    }
    notifyListeners();
  }
}
