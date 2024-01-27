import 'package:flutter/material.dart';

class SliderNotifier extends ChangeNotifier {
  List<double> sliderValues = [0, 50, 100];

  double _sliderValue = 0.0;

  double get sliderValue => _sliderValue;

  void setSliderValue(double value) {
    _sliderValue = value;
    notifyListeners();
  }

  void clearSliderValue() {
    _sliderValue = 0;
  }
}
