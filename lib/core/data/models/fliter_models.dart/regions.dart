import 'package:flutter/material.dart';

class SelectedRegionsModel extends ChangeNotifier {
  final List<String> _selectedRegions = [];

  List<String> get selectedRegions => _selectedRegions;

  bool isSelectedRegion(String region) {
    return _selectedRegions.contains(region);
  }

  void toggleSelectedRegion(String region) {
    if (_selectedRegions.contains(region)) {
      _selectedRegions.remove(region);
    } else {
      _selectedRegions.add(region);
    }
    notifyListeners();
  }
}
