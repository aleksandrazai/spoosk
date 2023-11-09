import 'package:flutter/material.dart';
import 'package:spoosk/core/data/models/ResortById.dart';
import 'package:spoosk/core/data/models/skipass_type.dart';

import '../../../colors.dart';

class TabletWidget extends StatelessWidget {
  const TabletWidget({Key? key, required this.skipasses}) : super(key: key);
  final List<Skipass>? skipasses;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DataTable(
        border: TableBorder.all(width: 0.1),
        headingRowColor: const MaterialStatePropertyAll(Color(0xFFBDE3FF)),
        columnSpacing: 100,
        columns: [
          DataColumn(
            label: Text(
              'Количество дней',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColors.text_black),
            ),
          ),
          DataColumn(
              label: Text(
            'Cтоимость от',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: AppColors.text_black),
            textAlign: TextAlign.center,
          )),
        ],
        rows: (skipasses ?? [])
            .map(
              (skipass) => DataRow(
                cells: [
                  DataCell(Center(
                    child: Text(
                        SkipassType.type[skipass.mobType] ?? skipass.mobType),
                  )),
                  DataCell(Center(
                    child: Text(skipass.price.toString().replaceAllMapped(
                        RegExp(r'(?<=\d)(?=(\d{3})+(?!\d))'), (match) => ' ')),
                  )),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
