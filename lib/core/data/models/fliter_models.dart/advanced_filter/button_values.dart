//доделать и учесть что можно выбрать либо дешевые либо дорогие

import 'package:spoosk/core/data/models/fliter_models.dart/advanced_filter/all_filter_params.dart';

List<String> sortByButtonLabels = [
  "Сначала дешевые",
  "Сначала дорогие",
  "Высокий рейтинг",
  "По протяженности трасс",
];

List<String> trailsButtonLabels = [
  "Легкие",
  "Средней сложности",
  "Повышенной сложности",
  "Сложные",
];

List<String> elevatorsButtonLabels = [
  "Бугельные",
  "Кресельные",
  "Гондольные",
  "Детские травалаторы",
];

List<String> instructorsButtonLabels = [
  "Для детей",
  "Для взрослых",
];

List<String> additionalButtonsLabels = [
  "Фрирайд",
  "Сноупарк",
  "Вечернее катание",
  "Прокат оборудования",
];

class GroupButtonMappings {
  static const Map<String, String> groupButtonParameterMap = {
    'Сначала дешевые': 'ordering=-skipass',
    'Сначала дорогие': 'ordering=skipass',
    'Легкие': 'have_green_skitrails=green',
    'Средней сложности': 'have_blue_skitrails=blue',
    'Повышенной сложности': 'have_red_skitrails=red',
    'Сложные': 'have_black_skitrails=black',
    "Бугельные": 'have_bugelny=1',
    "Кресельные": 'have_armchair=1',
    "Гондольные": 'have_gondola=1',
    "Детские травалаторы": 'have_travelators=1',
    "Для детей": 'have_children_school=1',
    'Для взрослых': 'have_adult_school=1',
    'Фрирайд': 'have_freeride=1',
    'Сноупарк': 'have_snowpark=1',
    "Вечернее катание": 'have_evening_skiing=1',
    "Прокат оборудования": 'have_rental=1',
  };

  static String mapToParameter(String option) {
    return groupButtonParameterMap[option] ?? '';
  }

  static Map<String, String> mapListToParameters(List<String> options) {
    return {
      for (String option in options) option: mapToParameter(option),
    };
  }
}
