import 'package:flutter/material.dart';
import 'package:spoosk/core/data/models/ResortById.dart';
import 'package:spoosk/core/data/models/skipass_type.dart';

import '../../../colors.dart';

class TabletWidget extends StatelessWidget {
  const TabletWidget({Key? key, required this.skipasses}) : super(key: key);
  final List<Skipass>? skipasses;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: DataTable(
        border: TableBorder.all(
          style: BorderStyle.none,
          width: 0.1,
          borderRadius: BorderRadius.circular(12),
        ),
        headingRowColor: MaterialStatePropertyAll(Color(0xFFBDE3FF)),
        columns: [
          DataColumn(
            label: Center(
              child: Text(
                'Тип скипасса',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: AppColors.text_black, fontSize: 16),
              ),
            ),
          ),
          DataColumn(
            label: Center(
              child: Text(
                'Cтоимость от',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: AppColors.text_black, fontSize: 16),
              ),
            ),
          ),
        ],
        rows: (skipasses ?? [])
            .map(
              (skipass) => DataRow(
                cells: [
                  DataCell(Center(
                    child: Text(
                        SkipassType.type[skipass.mobType] ?? skipass.mobType,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.text_black,
                            fontWeight: FontWeight.w700)),
                  )),
                  DataCell(Center(
                    child: Text(
                        skipass.price.toString().replaceAllMapped(
                                RegExp(r'(?<=\d)(?=(\d{3})+(?!\d))'),
                                (match) => ' ') +
                            ' р',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.text_black,
                            fontWeight: FontWeight.w700)),
                  )),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
