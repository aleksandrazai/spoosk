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
