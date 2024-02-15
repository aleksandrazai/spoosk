import 'package:flutter/material.dart';

class SelectedRegionsModel extends ChangeNotifier {
  final List<String> selectedRegions = [];

  bool isSelectedRegion(String region) {
    return selectedRegions.contains(region);
  }

  void toggleSelectedRegion(String region) {
    if (selectedRegions.contains(region)) {
      selectedRegions.remove(region);
    } else {
      selectedRegions.add(region);
    }
    notifyListeners();
  }
}
