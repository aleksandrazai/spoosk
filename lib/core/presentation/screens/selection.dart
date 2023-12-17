import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/main_filter/levels.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/main_filter/months.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/main_filter/regions.dart';
import 'package:spoosk/core/presentation/bloc_mainFilter.dart/mainFilter_bloc.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet_filter.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet_level.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet_month.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet_region.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/presentation/widgets/resort_screen_widgets/line_button_w_icons.dart';

@RoutePage()
class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.scaffoldBackgroundLight,
        title: Text(
          'Подбор курорта',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Image.asset(image_selection_header_bg),
            Column(children: [
              LineButtonWithIcons(
                onTap: () {
                  CustomBottomSheet.customShowModalBottomSheet(
                      height: MediaQuery.sizeOf(context).height * 0.4,
                      context: context,
                      children: <Widget>[
                        const SelectionScreenBottomSheetRegion()
                      ]);
                },
                margin: const EdgeInsets.only(top: 21, left: 20, right: 21),
                imageName: image_location_blue,
                text: _getSelectedRegionsText(),
              ),
              LineButtonWithIcons(
                  onTap: () {
                    CustomBottomSheet.customShowModalBottomSheet(
                        height: MediaQuery.sizeOf(context).height * 0.4,
                        context: context,
                        children: <Widget>[
                          const SelectionScreenBottomSheetMonth()
                        ]);
                  },
                  margin: const EdgeInsets.only(top: 21, left: 20, right: 21),
                  imageName: image_calendar,
                  text: _getSelectedMonthsText(),
                  color: AppColors.primaryColor),
              LineButtonWithIcons(
                  onTap: () {
                    CustomBottomSheet.customShowModalBottomSheet(
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        context: context,
                        children: <Widget>[
                          const SelectionScreenBottomSheetLevel(),
                        ]);
                  },
                  margin: const EdgeInsets.only(top: 21, left: 20, right: 21),
                  imageName: image_snowborder,
                  color: AppColors.primaryColor,
                  text: _getSelectedLevelsText()),
              Container(
                margin: const EdgeInsets.only(top: 21, left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        CustomBottomSheet.customShowModalBottomSheet(
                            height: MediaQuery.sizeOf(context).height,
                            context: context,
                            children: [
                              const SelectionScreenBottomSheetFilter()
                            ]);
                      },
                      child: Text(
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.primaryColor),
                          "Все фильтры"),
                    ),
                    const SizedBox(
                      width: 28,
                    ),
                    Text(
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.primaryColor),
                        "На карте")
                  ],
                ),
              )
            ]),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: CustomButton(
                    textStyle: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: AppColors.white, fontSize: 16),
                    boxDecoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 36,
                    buttonText: "Подобрать",
                    color: AppColors.primaryColor,
                    onTap: () {
                      final selectedRegionsModel =
                          Provider.of<SelectedRegionsModel>(context,
                              listen: false);
                      final selectedLevelsModel =
                          Provider.of<SelectedLevelsModel>(context,
                              listen: false);
                      final selectedMonthsModel =
                          Provider.of<SelectedMonthsModel>(context,
                              listen: false);

                      final mainFilterBloc = context.read<MainFilterBloc>();
                      mainFilterBloc.add(MainFilterRequest(
                        resort_region: selectedRegionsModel.selectedRegions,
                        resort_month: selectedMonthsModel.selectedMonths,
                        resort_level: selectedLevelsModel.selectedLevels,
                      ));
                      print(
                          "Selected request to API : ${selectedRegionsModel.selectedRegions},${selectedMonthsModel.selectedMonths},${selectedLevelsModel.selectedLevels} ");
                      context.router.push(const ResultRoute());
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getSelectedRegionsText() {
    final selectedRegions =
        Provider.of<SelectedRegionsModel>(context).selectedRegions;
    if (selectedRegions.isNotEmpty) {
      return selectedRegions.join(', ');
    } else {
      return 'Регион: Любой';
    }
  }

  String _getSelectedMonthsText() {
    final selectedMonths =
        Provider.of<SelectedMonthsModel>(context).selectedMonths;
    if (selectedMonths.isNotEmpty) {
      return selectedMonths.join(', ');
    } else {
      return 'Месяц: Любой';
    }
  }

  String _getSelectedLevelsText() {
    final selectedLevels =
        Provider.of<SelectedLevelsModel>(context).selectedLevels;
    if (selectedLevels.isNotEmpty) {
      return selectedLevels.join(', ');
    } else {
      return 'Уровень катания: Любой';
    }
  }
}
