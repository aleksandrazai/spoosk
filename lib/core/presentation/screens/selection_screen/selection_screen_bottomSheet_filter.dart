import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/widgets/CustomButtonWithContent.dart';

class SelectionScreenBottomSheetFilter extends StatefulWidget {
  const SelectionScreenBottomSheetFilter({Key? key}) : super(key: key);

  @override
  _SelectionScreenBottomSheetFilterState createState() =>
      _SelectionScreenBottomSheetFilterState();
}

class _SelectionScreenBottomSheetFilterState
    extends State<SelectionScreenBottomSheetFilter> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            children: [
              CustomButtonFilter(
                margin: const EdgeInsets.only(right: 8),
                text: "Рейтингу",
              ),
              CustomButtonFilter(
                margin: const EdgeInsets.only(right: 8),
                text: "Цене на ски-пасс",
              ),
              CustomButtonFilter(
                margin: const EdgeInsets.only(right: 8),
                text: "Протяженности трасс",
              )
            ],
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
            children: [
              CustomButtonFilter(
                margin: const EdgeInsets.only(top: 12),
                text: "Легкие",
              ),
              CustomButtonFilter(
                margin: const EdgeInsets.only(top: 12),
                text: "Средней сложности",
              ),
              CustomButtonFilter(
                margin: const EdgeInsets.only(top: 12),
                text: "Повышенной сложности",
              ),
              CustomButtonFilter(
                margin: const EdgeInsets.only(top: 12),
                text: "Повышенной сложности",
              ),
              CustomButtonFilter(
                margin: const EdgeInsets.only(top: 12),
                text: "Сложные",
              ),
            ],
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
            children: [
              CustomButtonFilter(
                margin: const EdgeInsets.only(top: 12),
                text: "Легкие",
              ),
              CustomButtonFilter(
                margin: const EdgeInsets.only(top: 12),
                text: "Средней сложности",
              ),
              CustomButtonFilter(
                margin: const EdgeInsets.only(top: 12),
                text: "Повышенной сложности",
              ),
              CustomButtonFilter(
                margin: const EdgeInsets.only(top: 12),
                text: "Повышенной сложности",
              ),
              CustomButtonFilter(
                margin: const EdgeInsets.only(top: 12),
                text: "Сложные",
              ),
            ],
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
          )
        ],
      ),
    );
  }
}
