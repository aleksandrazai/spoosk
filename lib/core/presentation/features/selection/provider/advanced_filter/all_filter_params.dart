import 'package:flutter/material.dart';

enum FilterType {
  Sort,
  Trails,
  Elevator,
  Instructor,
  Additionally,
}

class AdvancedFilterNotifier extends ChangeNotifier {
  List<String> sortGroupButton = [];
  List<String> trailsGroupButton = [];
  List<String> elevatorGroupButton = [];
  List<String> instructorGroupButton = [];
  List<String> additionallyGroupButton = [];

  List<String> get allGroupButtons => getAllFilterValues();

  void setGroupButton({
    required String textButton,
    required FilterType groupButtonType,
  }) {
    switch (groupButtonType) {
      case FilterType.Sort:
        if (textButton == "Сначала дешевые") {
          toggleListValue(sortGroupButton, textButton);
          deselectValue("Сначала дорогие");
        } else if (textButton == "Сначала дорогие") {
          toggleListValue(sortGroupButton, textButton);
          deselectValue("Сначала дешевые");
        } else {
          toggleListValue(sortGroupButton, textButton);
        }
        break;
      case FilterType.Trails:
        toggleListValue(trailsGroupButton, textButton);
        break;
      case FilterType.Elevator:
        toggleListValue(elevatorGroupButton, textButton);
        break;
      case FilterType.Instructor:
        toggleListValue(instructorGroupButton, textButton);
        break;
      case FilterType.Additionally:
        toggleListValue(additionallyGroupButton, textButton);
        break;
    }
    notifyListeners();
  }

  void toggleListValue(List<String> list, String value) {
    if (list.contains(value)) {
      list.remove(value);
    } else {
      list.add(value);
    }
  }

  bool isSelected({
    required FilterType groupButtonType,
    required String value,
  }) {
    List<String> selectedList = _getSelectedList(groupButtonType);
    return selectedList.contains(value);
  }

  List<String> _getSelectedList(FilterType groupButtonType) {
    switch (groupButtonType) {
      case FilterType.Sort:
        return sortGroupButton;
      case FilterType.Trails:
        return trailsGroupButton;
      case FilterType.Elevator:
        return elevatorGroupButton;
      case FilterType.Instructor:
        return instructorGroupButton;
      case FilterType.Additionally:
        return additionallyGroupButton;
    }
  }

  List<String> getAllFilterValues() {
    List<String> allGroupButtons = [];
    allGroupButtons.addAll(sortGroupButton);
    allGroupButtons.addAll(trailsGroupButton);
    allGroupButtons.addAll(elevatorGroupButton);
    allGroupButtons.addAll(instructorGroupButton);
    allGroupButtons.addAll(additionallyGroupButton);
    return allGroupButtons;
  }

  void clearAllStates() {
    print(
        "Before clearing: $sortGroupButton, $trailsGroupButton, $elevatorGroupButton, $instructorGroupButton, $additionallyGroupButton,");
    sortGroupButton.clear();
    trailsGroupButton.clear();
    elevatorGroupButton.clear();
    instructorGroupButton.clear();
    additionallyGroupButton.clear();
    print(
        "After clearing: $sortGroupButton, $trailsGroupButton, $elevatorGroupButton, $instructorGroupButton, $additionallyGroupButton,");

    notifyListeners();
  }

  void deselectValue(String oppositeOption) {
    if (sortGroupButton.contains(oppositeOption)) {
      sortGroupButton.remove(oppositeOption);
    }
  }
}
