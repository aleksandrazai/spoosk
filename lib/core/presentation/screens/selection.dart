import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';

@RoutePage()
class Selection extends StatefulWidget {
  const Selection({Key? key}) : super(key: key);

  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image.asset(image_selection_header_bg),
              Column(children: [
                _navigateTo(
                    margin: const EdgeInsets.only(top: 21, left: 20),
                    imageName: image_location_blue,
                    text: "Регион"),
                _navigateTo(
                    margin: const EdgeInsets.only(top: 21, left: 20),
                    imageName: image_calendar,
                    text: "Месяц",
                    color: AppColors.primaryColor),
                _navigateTo(
                    margin: const EdgeInsets.only(top: 21, left: 20),
                    imageName: image_snowborder,
                    text: "Уровень катания"),
                Container(
                  margin: const EdgeInsets.only(top: 21, left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.primaryColor),
                          "Все фильтры"),
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
              const Spacer(),
              Container(
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
              )
            ],
          )),
    );
  }

  Widget _navigateTo(
      {required String imageName,
      required String text,
      Color? color,
      EdgeInsets? margin}) {
    return Container(
      margin: margin,
      child: Row(
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
          )
        ],
      ),
    );
  }
}
