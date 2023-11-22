class UserLevel {
  static List<String> userLevel = [
    'Ученик',
    'Новичок',
    'Опытный',
    'Экстремал',
  ];

  static const Map<String, String> levelColorMap = {
    'Ученик': 'green',
    'Новичок': 'blue',
    'Опытный': 'red',
    'Экстремал': 'black',
  };

  static List<String> mapLevelsToColors(List<String> userLevel) {
    return userLevel.map((level) => levelColorMap[level] ?? level).toList();
  }
}
