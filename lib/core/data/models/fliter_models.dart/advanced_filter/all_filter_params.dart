import 'package:flutter/material.dart';

enum GroupButtonType {
  Sort,
  Trails,
  Elevator,
  Instructor,
  Additionally,
}

class GroupButtonNotifierModel extends ChangeNotifier {
  List<String> sortGroupButton = [];
  List<String> trailsGroupButton = [];
  List<String> elevatorGroupButton = [];
  List<String> instructorGroupButton = [];
  List<String> additionallyGroupButton = [];
  List<String> get allGroupButtons => getAllGroupButtons();

  void setGroupButton({
    required String textButton,
    required GroupButtonType groupButtonType,
  }) {
    switch (groupButtonType) {
      case GroupButtonType.Sort:
        toggleListValue(sortGroupButton, textButton);
        break;
      case GroupButtonType.Trails:
        toggleListValue(trailsGroupButton, textButton);
        break;
      case GroupButtonType.Elevator:
        toggleListValue(elevatorGroupButton, textButton);
        break;
      case GroupButtonType.Instructor:
        toggleListValue(instructorGroupButton, textButton);
        break;
      case GroupButtonType.Additionally:
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
    required GroupButtonType groupButtonType,
    required String value,
  }) {
    List<String> selectedList = _getSelectedList(groupButtonType);
    return selectedList.contains(value);
  }

  List<String> _getSelectedList(GroupButtonType groupButtonType) {
    switch (groupButtonType) {
      case GroupButtonType.Sort:
        return sortGroupButton;
      case GroupButtonType.Trails:
        return trailsGroupButton;
      case GroupButtonType.Elevator:
        return elevatorGroupButton;
      case GroupButtonType.Instructor:
        return instructorGroupButton;
      case GroupButtonType.Additionally:
        return additionallyGroupButton;
    }
  }

  List<String> getAllGroupButtons() {
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
}
