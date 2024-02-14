import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/advanced_filter/all_filter_params.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/advanced_filter/slider.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/main_filter/levels.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/main_filter/months.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet_filter.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet_level.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet_month.dart';
import 'package:spoosk/core/presentation/widgets/CustomButtonWithContent.dart';
import '../../../colors.dart';
import '../../../data/models/fliter_models.dart/main_filter/regions.dart';
import '../../bloc_mainFilter.dart/mainFilter_bloc.dart';
import '../../image.dart';
import '../../routes.gr.dart';
import '../../theme/theme.dart';
import '../../widgets/CustomButton.dart';
import '../../widgets/resort_card.dart';

@RoutePage()
class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late final SelectedLevelsModel levelsModel;
  late final SelectedRegionsModel regionModel;
  late final SelectedMonthsModel monthModel;
  late final AdvancedFilterNotifier advancedFilter;
  late final SliderNotifier sliderFilter;

  @override
  void initState() {
    super.initState();
    levelsModel = Provider.of<SelectedLevelsModel>(context, listen: false);
    regionModel = Provider.of<SelectedRegionsModel>(context, listen: false);
    monthModel = Provider.of<SelectedMonthsModel>(context, listen: false);
    advancedFilter =
        Provider.of<AdvancedFilterNotifier>(context, listen: false);
    sliderFilter = Provider.of<SliderNotifier>(context, listen: false);

    levelsModel.addListener(() {
      _filterRequest();
    });
    regionModel.addListener(() {
      _filterRequest();
    });
    monthModel.addListener(() {
      _filterRequest();
    });
    advancedFilter.addListener(() {
      _filterRequest();
    });
    sliderFilter.addListener(() {
      _filterRequest();
    });
  }

  void _filterRequest() {
    final mainFilterBloc = context.read<MainFilterBloc>();

    mainFilterBloc.add(
      MainFilterRequest(
        resort_region: regionModel.selectedRegions,
        resort_month: monthModel.selectedMonths,
        resort_level: levelsModel.selectedLevels,
        group_button: advancedFilter.allGroupButtons,
        slider: sliderFilter.sliderValue.toStringAsFixed(0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        titleTextStyle: TextStyle(
          color: AppColors.black,
          fontSize: 18,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w700,
        ),
        leading: GestureDetector(
          onTap: () {
            Feedback.forTap(context);
            context.router.pop();
          },
          child: SvgPicture.asset(
            fit: BoxFit.scaleDown,
            image_arrow_left,
            width: 9.33,
            height: 16.33,
          ),
        ),
        title: Provider.of<SelectedRegionsModel>(context)
                .selectedRegions
                .isNotEmpty
            ? Text(
                Provider.of<SelectedRegionsModel>(context)
                    .selectedRegions
                    .toString()
                    .replaceAll('[', '')
                    .replaceAll(']', ''),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              )
            : const Text(
                'Курорты',
                textAlign: TextAlign.start,
              ),
      ),
      body: BlocBuilder<MainFilterBloc, MainFilterState>(
          builder: (context, state) {
        if (state is MainFilterLoaded) {
          return Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 7.0),
                        child: CustomButton(
                            margin: const EdgeInsets.only(top: 14),
                            buttonText: 'Все фильтры',
                            color: AppColors.primaryColor,
                            boxDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            height: 28,
                            width: 120,
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: AppColors.white, fontSize: 16),
                            onTap: () {
                              CustomBottomSheet.customShowModalBottomSheet(
                                  height: MediaQuery.sizeOf(context).height,
                                  context: context,
                                  children: [
                                    const SelectionScreenBottomSheetFilter()
                                  ]);
                            }),
                      ),
                      Consumer<SelectedLevelsModel>(
                          builder: (context, levelsModel, _) {
                        return Wrap(
                          spacing: 7,
                          children: levelsModel.selectedLevels
                              .map(
                                (level) => CustomButtonFilter(
                                  margin: const EdgeInsets.only(top: 12),
                                  onPress: () {
                                    CustomBottomSheet
                                        .customShowModalBottomSheet(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.3,
                                            context: context,
                                            children: <Widget>[
                                          const SelectionScreenBottomSheetLevel(),
                                        ]);
                                  },
                                  text: level,
                                ),
                              )
                              .toList(),
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7.0),
                        child: Consumer<SelectedMonthsModel>(
                          builder: (context, monthModel, _) {
                            return Wrap(
                              spacing: 7,
                              children: monthModel.selectedMonths
                                  .map(
                                    (month) => CustomButtonFilter(
                                      margin: const EdgeInsets.only(top: 12),
                                      onPress: () {
                                        CustomBottomSheet
                                            .customShowModalBottomSheet(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.3,
                                                context: context,
                                                children: <Widget>[
                                              const SelectionScreenBottomSheetMonth(),
                                            ]);
                                      },
                                      text: month,
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Найдено ${state.resortsMainFilter.length} курортов',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: AppColors.text_black),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.resortsMainFilter.length,
                    itemBuilder: (context, index) {
                      final resort = state.resortsMainFilter[index];
                      return ResortCard(resort: resort);
                    },
                  ),
                ),
              ),
            ],
          );
        } else if (state is MainFilterNotFound) {
          return Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  'К сожалению, мы не нашли ни один курорт, \n подходящий под Ваши параметры. \n Попробуйте изменить параметры поиска.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.text_black),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                  textStyle: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: AppColors.white, fontSize: 16),
                  boxDecoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 40,
                  buttonText: "К подбору ",
                  color: AppColors.primaryColor,
                  onTap: () {
                    context.router.push(const Selection());
                  },
                ),
              ),
            ],
          );
        }
        return const CircularProgressIndicator();
      }),
    );
  }
}
