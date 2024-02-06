import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../colors.dart';
import '../../../data/models/fliter_models.dart/main_filter/regions.dart';
import '../../bloc_mainFilter.dart/mainFilter_bloc.dart';
import '../../image.dart';
import '../../routes.gr.dart';
import '../../theme/theme.dart';
import '../../widgets/CustomButton.dart';
import '../../widgets/resort_card.dart';

@RoutePage()
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

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
