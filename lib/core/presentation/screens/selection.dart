import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet_filter.dart';
import 'package:spoosk/core/presentation/screens/selection_screen/selection_screen_bottomSheet_region.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';

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
                _navigateTo(
                    onTap: () {
                      CustomBottomSheet.customShowModalBottomSheet(
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          context: context,
                          children: <Widget>[
                            SelectionScreenBottomSheetRegion()
                          ]);
                    },
                    margin: const EdgeInsets.only(top: 21, left: 20, right: 21),
                    imageName: image_location_blue,
                    text: "Регион"),
                _navigateTo(
                    onTap: () {},
                    margin: const EdgeInsets.only(top: 21, left: 20, right: 21),
                    imageName: image_calendar,
                    text: "Месяц",
                    color: AppColors.primaryColor),
                _navigateTo(
                    onTap: () {},
                    margin: const EdgeInsets.only(top: 21, left: 20, right: 21),
                    imageName: image_snowborder,
                    color: AppColors.primaryColor,
                    text: "Уровень катания"),
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
                    onTap: () {},
                  ),
                ),
              ))
            ],
          )),
    );
  }

  Widget _navigateTo(
      {required void Function() onTap,
      required String imageName,
      required String text,
      Color? color,
      EdgeInsets? margin}) {
    return InkWell(
      child: Container(
        margin: margin,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: AppColors.blue_light,
          onTap: () {
            onTap();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Center(child: SvgPicture.asset(color: color, imageName)),
              ),
              const SizedBox(
                width: 22,
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.text_black),
              ),
              const Spacer(),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(pi),
                child: SvgPicture.asset(
                    color: AppColors.blue_light, image_arrow_left),
              )
            ],
          ),
        ),
      ),
    );
  }
}
