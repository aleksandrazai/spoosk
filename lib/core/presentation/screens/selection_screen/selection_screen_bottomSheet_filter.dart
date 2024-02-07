// ignore_for_file: constant_identifier_names, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/advanced_filter/all_filter_params.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/advanced_filter/button_values.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/advanced_filter/slider.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/presentation/widgets/CustomButtonWithContent.dart';
import 'package:spoosk/core/presentation/widgets/CustomCircle.dart';

class SelectionScreenBottomSheetFilter extends StatefulWidget {
  const SelectionScreenBottomSheetFilter({super.key});

  @override
  _SelectionScreenBottomSheetFilterState createState() =>
      _SelectionScreenBottomSheetFilterState();
}

class _SelectionScreenBottomSheetFilterState
    extends State<SelectionScreenBottomSheetFilter> {
  List<Widget> _buildButtonsList(
      {List<Widget>? icon,
      double? spasing,
      required List<String> buttonTexts,
      required FilterType groupButtonType,
      required List<String> state}) {
    List<Widget> buttons = [];
    final groupButtonNotifier =
        Provider.of<AdvancedFilterNotifier>(context, listen: false);
    for (int id = 1; id <= buttonTexts.length; id++) {
      String buttonText = buttonTexts[id - 1];
      buttons.add(
        CustomButtonFilter(
          margin: const EdgeInsets.only(top: 12),
          spasing: spasing,
          icon: icon?[id - 1],
          // id: id,
          currentSelected: groupButtonNotifier.isSelected(
            groupButtonType: groupButtonType,
            value: buttonText,
          ),
          onPress: () {
            setState(() {
              groupButtonNotifier.setGroupButton(
                textButton: buttonText,
                groupButtonType: groupButtonType,
              );
              print('Button $buttonText is selected, List $groupButtonType');
            });
          },
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
        height: MediaQuery.of(context).size.height - 50,
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
                  groupButtonType: FilterType.Sort,
                  buttonTexts: sortByButtonLabels,
                  state: Provider.of<AdvancedFilterNotifier>(context)
                      .sortGroupButton),
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
                  groupButtonType: FilterType.Trails,
                  buttonTexts: trailsButtonLabels,
                  state: Provider.of<AdvancedFilterNotifier>(context)
                      .trailsGroupButton),
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
                  groupButtonType: FilterType.Elevator,
                  buttonTexts: elevatorsButtonLabels,
                  state: Provider.of<AdvancedFilterNotifier>(context)
                      .elevatorGroupButton),
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
                  groupButtonType: FilterType.Instructor,
                  buttonTexts: instructorsButtonLabels,
                  state: Provider.of<AdvancedFilterNotifier>(context)
                      .instructorGroupButton),
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
              child: Consumer<SliderNotifier>(
                  builder: (context, sliderNotifier, _) {
                return Slider(
                  value: sliderNotifier.sliderValue,
                  min: sliderNotifier.sliderValues.first,
                  max: sliderNotifier.sliderValues.last,
                  divisions: sliderNotifier.sliderValues.length - 1,
                  onChanged: (double value) {
                    sliderNotifier.setSliderValue(value);
                  },
                );
              }),
            ),
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
                  groupButtonType: FilterType.Additionally,
                  buttonTexts: additionalButtonsLabels,
                  state: Provider.of<AdvancedFilterNotifier>(context)
                      .additionallyGroupButton),
            ),
            Expanded(
              child: Align(
                // alignment: Alignment.bottomCenter,
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                        flex: 1,
                        child: CustomButton(
                          textStyle:
                              Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: (Provider.of<AdvancedFilterNotifier>(
                                                  context)
                                              .sortGroupButton
                                              .isNotEmpty ||
                                          Provider.of<AdvancedFilterNotifier>(
                                                  context)
                                              .trailsGroupButton
                                              .isNotEmpty ||
                                          Provider.of<AdvancedFilterNotifier>(
                                                  context)
                                              .elevatorGroupButton
                                              .isNotEmpty ||
                                          Provider.of<AdvancedFilterNotifier>(
                                                  context)
                                              .instructorGroupButton
                                              .isNotEmpty ||
                                          Provider.of<AdvancedFilterNotifier>(
                                                  context)
                                              .additionallyGroupButton
                                              .isNotEmpty ||
                                          Provider.of<SliderNotifier>(context)
                                                  .sliderValue !=
                                              0)
                                      ? AppColors.icons_active_blue
                                      : AppColors.icons_not_Active_gray,
                                  fontSize: 16),
                          boxDecoration: BoxDecoration(
                              border: Border.all(
                                  color: (Provider.of<AdvancedFilterNotifier>(
                                                  context)
                                              .sortGroupButton
                                              .isNotEmpty ||
                                          Provider.of<AdvancedFilterNotifier>(
                                                  context)
                                              .trailsGroupButton
                                              .isNotEmpty ||
                                          Provider.of<AdvancedFilterNotifier>(
                                                  context)
                                              .elevatorGroupButton
                                              .isNotEmpty ||
                                          Provider.of<AdvancedFilterNotifier>(
                                                  context)
                                              .instructorGroupButton
                                              .isNotEmpty ||
                                          Provider.of<AdvancedFilterNotifier>(
                                                  context)
                                              .additionallyGroupButton
                                              .isNotEmpty ||
                                          Provider.of<SliderNotifier>(context)
                                                  .sliderValue !=
                                              0)
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
                      flex: 1,
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
                        onTap: () {
                          final sliderValue = Provider.of<SliderNotifier>(
                                  context,
                                  listen: false)
                              .sliderValue;
                          List<String> allGroupButtons =
                              Provider.of<AdvancedFilterNotifier>(context,
                                      listen: false)
                                  .allGroupButtons;
                          print(
                              'Passed to Selection Screen: $allGroupButtons + $sliderValue');

                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _clearAllGroup() {
    setState(() {
      Provider.of<AdvancedFilterNotifier>(context, listen: false)
          .clearAllStates();
    });
    setState(() {
      Provider.of<SliderNotifier>(context, listen: false).clearSliderValue();
    });
  }
}
