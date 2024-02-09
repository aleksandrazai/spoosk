import 'package:flutter/widgets.dart';

String declensionWords(int? count) {
  if (count == null) {
    return '';
  }

  if (count != null && count % 10 == 1 && count % 100 != 11) {
    return '$count отзыв';
  } else if (count! % 10 >= 2 &&
      count % 10 <= 4 &&
      (count % 100 < 10 || count % 100 >= 20)) {
    return '$count отзыва';
  } else {
    return '$count отзывов';
  }
}

// ------------------------------ Адавптивные размеры ------------------------------
// baseWidth - размер от размера макета макета
class PercentCalculator {
  static double calculatePercent(double width, double baseWidth) {
    if (baseWidth == 0) {
      throw ArgumentError('baseWidth cannot be 0.');
    }
    return (width / baseWidth) * 100;
  }
}
