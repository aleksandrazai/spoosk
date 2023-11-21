// ignore_for_file: constant_identifier_names, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/presentation/widgets/CustomButtonWithContent.dart';
import 'package:spoosk/core/presentation/widgets/CustomCircle.dart';

enum GroupButtonType {
  Sort,
  Trails,
  Elevator,
  Instructor,
  Additionally,
}

class SelectionScreenBottomSheetFilter extends StatefulWidget {
  const SelectionScreenBottomSheetFilter({Key? key}) : super(key: key);

  @override
  _SelectionScreenBottomSheetFilterState createState() =>
      _SelectionScreenBottomSheetFilterState();
}

class _SelectionScreenBottomSheetFilterState
    extends State<SelectionScreenBottomSheetFilter> {
  num sliderValue = 0;
  final List<double> values = [0, 50, 100];
  int selectedIndex = 0;

  List<String> sort_group_button = [];
  List<String> trails_group_button = [];
  List<String> elevator_group_button = [];
  List<String> instructor_group_button = [];
  List<String> additionally_group_button = [];

  void _setGroupButton(
      {required GroupButtonType groupButtonType, required String textButton}) {
    setState(() {
      switch (groupButtonType) {
        case GroupButtonType.Sort:
          setState(() {
            if (sort_group_button.contains(textButton)) {
              sort_group_button.remove(textButton);
            } else {
              sort_group_button.add(textButton);
            }
            sort_group_button = sort_group_button;
          });
          print(sort_group_button);

          break;
        case GroupButtonType.Trails:
          setState(() {
            if (trails_group_button.contains(textButton)) {
              trails_group_button.remove(textButton);
            } else {
              trails_group_button.add(textButton);
            }
            trails_group_button = trails_group_button;
          });
          print(trails_group_button);
          break;
        case GroupButtonType.Elevator:
          setState(() {
            if (elevator_group_button.contains(textButton)) {
              elevator_group_button.remove(textButton);
            } else {
              elevator_group_button.add(textButton);
            }
            elevator_group_button = elevator_group_button;
          });
          break;
        case GroupButtonType.Instructor:
          setState(() {
            if (instructor_group_button.contains(textButton)) {
              instructor_group_button.remove(textButton);
            } else {
              instructor_group_button.add(textButton);
            }
            instructor_group_button = instructor_group_button;
          });
          break;
        case GroupButtonType.Additionally:
          setState(() {
            if (additionally_group_button.contains(textButton)) {
              additionally_group_button.remove(textButton);
            } else {
              additionally_group_button.add(textButton);
            }
            additionally_group_button = additionally_group_button;
          });
          break;
      }
    });
  }

  List<Widget> _buildButtonsList(
      {List<Widget>? icon,
      double? spasing,
      required List<String> buttonTexts,
      required GroupButtonType groupButtonType,
      required List<String> state}) {
    List<Widget> buttons = [];

    for (int id = 1; id <= buttonTexts.length; id++) {
      buttons.add(
        CustomButtonFilter(
          margin: const EdgeInsets.only(top: 12),
          spasing: spasing,
          icon: icon?[id - 1],
          // id: id,
          onPress: () => _setGroupButton(
              groupButtonType: groupButtonType,
              textButton: buttonTexts[id - 1]),
          text: buttonTexts[id - 1],
        ),
      );
    }

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                    style: Theme.of(context).textTheme.headlineMedium,
                    "Сортировать по"),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Wrap(
              spacing: 8,
              children: _buildButtonsList(
                  groupButtonType: GroupButtonType.Sort,
                  buttonTexts: [
                    "Высокий рейтинг",
                    "Сначала дешевые",
                    "Сначала дорогие",
                    "По протяженности трасс",
                  ],
                  state: sort_group_button),
            ),
            Container(
              margin: const EdgeInsets.only(top: 28),
              child: Row(
                children: [
                  Text(
                      style: Theme.of(context).textTheme.headlineMedium,
                      "Трассы"),
                ],
              ),
            ),
            Wrap(
              spacing: 8,
              children: _buildButtonsList(
                  spasing: 10,
                  icon: [
                    CustomCircle(color: AppColors.chart_green),
                    CustomCircle(color: AppColors.chart_blue),
                    CustomCircle(color: AppColors.chart_pink),
                    CustomCircle(color: AppColors.chart_black),
                  ],
                  groupButtonType: GroupButtonType.Trails,
                  buttonTexts: [
                    "Легкие",
                    "Средней сложности",
                    "Повышенной сложности",
                    "Сложные",
                  ],
                  state: trails_group_button),
            ),
            Container(
              margin: const EdgeInsets.only(top: 28),
              child: Row(
                children: [
                  Text(
                      style: Theme.of(context).textTheme.headlineMedium,
                      "Подъемники"),
                ],
              ),
            ),
            Wrap(
              spacing: 8,
              children: _buildButtonsList(
                  icon: [
                    SvgPicture.asset(
                        color: AppColors.primaryColor, image_type_bugelny),
                    SvgPicture.asset(
                        color: AppColors.primaryColor, image_type_carousel),
                    SvgPicture.asset(
                        color: AppColors.primaryColor, image_type_handball),
                    SvgPicture.asset(
                        color: AppColors.primaryColor, image_type_children),
                  ],
                  spasing: 10,
                  groupButtonType: GroupButtonType.Elevator,
                  buttonTexts: [
                    "Бугельные",
                    "Кресельные",
                    "Гондольные",
                    "Детские травалаторы",
                  ],
                  state: elevator_group_button),
            ),
            Container(
              margin: const EdgeInsets.only(top: 28),
              child: Row(
                children: [
                  Text(
                      style: Theme.of(context).textTheme.headlineMedium,
                      "Горнолыжные школы / инструктора"),
                ],
              ),
            ),
            Wrap(
              spacing: 8,
              children: _buildButtonsList(
                  groupButtonType: GroupButtonType.Instructor,
                  buttonTexts: [
                    "Для детей",
                    "Для взрослых",
                  ],
                  state: instructor_group_button),
            ),
            Container(
              margin: const EdgeInsets.only(top: 28),
              child: Row(
                children: [
                  Text(
                      style: Theme.of(context).textTheme.headlineMedium,
                      "Расстояние от ближайшего аэропорта"),
                ],
              ),
            ),
            SliderTheme(
                data: SliderThemeData(
                  overlayShape: SliderComponentShape.noOverlay,
                  trackHeight: 4,
                  tickMarkShape:
                      const RoundSliderTickMarkShape(tickMarkRadius: 3),
                  thumbShape: const RoundSliderThumbShape(
                      elevation: 5, enabledThumbRadius: 14.0),
                  thumbColor: Colors.white,
                  activeTrackColor: AppColors.primaryColor,
                  inactiveTrackColor: const Color.fromRGBO(120, 120, 128, 0.2),
                  valueIndicatorColor: Colors.blue,
                  activeTickMarkColor: AppColors.primaryColor,
                  inactiveTickMarkColor: AppColors.primaryColor,
                  overlayColor: Colors.blue.withOpacity(0.2),
                ),
                child: Slider(
                  value: selectedIndex.toDouble(),
                  min: 0,
                  max: values.length - 1,
                  divisions: values.length - 1,
                  onChanged: (double value) {
                    sliderValue = values[value.toInt()];
                    setState(() {
                      selectedIndex = value.toInt();
                    });
                  },
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width - (28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 12, color: Colors.black),
                      "Любое"),
                  Text(
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 12, color: Colors.black),
                      'Не более\n50 км.'),
                  Text(
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 12, color: Colors.black),
                      'Не более\n100 км.'),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 28),
              child: Row(
                children: [
                  Text(
                      style: Theme.of(context).textTheme.headlineMedium,
                      "Дополнительно"),
                ],
              ),
            ),
            Wrap(
              spacing: 8,
              children: _buildButtonsList(
                  groupButtonType: GroupButtonType.Additionally,
                  buttonTexts: [
                    "Фрирайд",
                    "Сноупарк",
                    "Вечернее катание",
                    "Прокат оборудования",
                    "Сезонный ски-пасс",
                  ],
                  state: additionally_group_button),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  Flexible(
                      flex: 2,
                      child: CustomButton(
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                color: (sort_group_button.isNotEmpty ||
                                        trails_group_button.isNotEmpty ||
                                        elevator_group_button.isNotEmpty ||
                                        instructor_group_button.isNotEmpty ||
                                        additionally_group_button.isNotEmpty ||
                                        selectedIndex != 0)
                                    ? AppColors.icons_active_blue
                                    : AppColors.icons_not_Active_gray,
                                fontSize: 16),
                        boxDecoration: BoxDecoration(
                            border: Border.all(
                                color: (sort_group_button.isNotEmpty ||
                                        trails_group_button.isNotEmpty ||
                                        elevator_group_button.isNotEmpty ||
                                        instructor_group_button.isNotEmpty ||
                                        additionally_group_button.isNotEmpty ||
                                        selectedIndex != 0)
                                    ? AppColors.icons_active_blue
                                    : AppColors.icons_not_Active_gray),
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        buttonText: "Сбросить",
                        color: AppColors.transparent,
                        onTap: _clearAllGroup,
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                      flex: 2,
                      child: CustomButton(
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: AppColors.white, fontSize: 16),
                        boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        buttonText: "Применить",
                        color: AppColors.primaryColor,
                        onTap: () {},
                      )),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  _clearAllGroup() {
    setState(() {
      sort_group_button = [];
      trails_group_button = [];
      elevator_group_button = [];
      instructor_group_button = [];
      additionally_group_button = [];
      sliderValue = 0;
      selectedIndex = 0;
    });
  }
}
