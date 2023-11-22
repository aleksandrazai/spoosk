import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/levels.dart';
import 'package:spoosk/core/data/models/user_level.dart';
import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/presentation/widgets/CustomButtonWithContent.dart';

class SelectionScreenBottomSheetLevel extends StatefulWidget {
  const SelectionScreenBottomSheetLevel({super.key});

  @override
  State<SelectionScreenBottomSheetLevel> createState() =>
      _SelectionScreenBottomSheetLevelState();
}

class _SelectionScreenBottomSheetLevelState
    extends State<SelectionScreenBottomSheetLevel> {
  late final SelectedLevelsModel levelsModel;
  @override
  void initState() {
    super.initState();
    levelsModel = Provider.of<SelectedLevelsModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
              style: Theme.of(context).textTheme.headlineMedium,
              "Оцените ваш уровень катания"),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 60),
          child: Container(
            alignment: Alignment.topLeft,
            child: Wrap(
                spacing: 7,
                children: UserLevel.userLevel
                    .map(
                      (level) => CustomButtonFilter(
                          currentSelected: levelsModel.isSelectedLevel(level),
                          onPress: () {
                            setState(() {
                              levelsModel.toggleSelectedLevel(level);
                            });
                          },
                          text: level),
                    )
                    .toList()),
          ),
        ),
        Column(
          children: [
            CustomButton(
              textStyle: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: AppColors.white, fontSize: 16),
              boxDecoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              height: 36,
              buttonText: "Применить",
              color: AppColors.primaryColor,
              onTap: () {
                List<String> selectedLevels =
                    Provider.of<SelectedLevelsModel>(context, listen: false)
                        .selectedLevels;
                print("Selected Levels: $selectedLevels");

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
