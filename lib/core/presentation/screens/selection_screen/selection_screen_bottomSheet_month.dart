import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/resort_month.dart';
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
  @override
  Widget build(BuildContext context) {
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
                  text: ResortMonths.month.elementAt(index));
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
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
