import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/fliter_models.dart/months.dart';
import 'package:spoosk/core/data/models/month.dart';

import 'package:spoosk/core/presentation/widgets/CustomButton.dart';
import 'package:spoosk/core/presentation/widgets/CustomButtonWithContent.dart';

class SelectionScreenBottomSheetMonth extends StatefulWidget {
  const SelectionScreenBottomSheetMonth({super.key});

  @override
  State<SelectionScreenBottomSheetMonth> createState() =>
      _SelectionScreenBottomSheetMonthState();
}

class _SelectionScreenBottomSheetMonthState
    extends State<SelectionScreenBottomSheetMonth> {
  late final SelectedMonthsModel monthModel;

  @override
  void initState() {
    super.initState();
    monthModel = Provider.of<SelectedMonthsModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final month = ResortMonths.month;
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
              style: Theme.of(context).textTheme.headlineMedium,
              "В каком месяце вы планируете покататься?"),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 60),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 4,
              mainAxisExtent: 40,
              childAspectRatio: 2 / 4,
            ),
            itemCount: ResortMonths.month.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomButtonFilter(
                margin: const EdgeInsets.symmetric(vertical: 4),
                text: month.elementAt(index),
                currentSelected:
                    monthModel.isSelectedMonth(month.elementAt(index)),
                onPress: () {
                  setState(() {
                    monthModel.toggleSelectedMonth(month.elementAt(index));
                  });
                },
              );
            },
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
                Provider.of<SelectedMonthsModel>(context, listen: false)
                    .selectedMonths;
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
