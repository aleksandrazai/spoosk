import 'package:flutter/material.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/ResortById.dart';
import 'package:spoosk/core/data/models/skipass_type.dart';

class SkipassTable extends StatelessWidget {
  const SkipassTable({super.key, required this.skipasses});
  final List<Skipass>? skipasses;

  @override
  Widget build(BuildContext context) {
    List<Skipass> filteredSkipasses =
        (skipasses ?? []).where((skipass) => skipass.price != '0.00').toList();
    filteredSkipasses
        .sort((a, b) => double.parse(a.price).compareTo(double.parse(b.price)));
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 0.1),
      ),
      width: MediaQuery.sizeOf(context).width,
      child: DataTable(
        headingRowHeight: 36,
        dataRowHeight: 36,
        border: TableBorder.all(
          style: BorderStyle.none,
          width: 0.1,
          borderRadius: BorderRadius.circular(12),
        ),
        headingRowColor: const MaterialStatePropertyAll(Color(0xFFBDE3FF)),
        columns: [
          DataColumn(
            label: Center(
              child: Center(
                child: Text(
                  'Тип скипасса',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: AppColors.text_black, fontSize: 16),
                ),
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
        rows: filteredSkipasses
            .map(
              (skipass) => DataRow(
                cells: [
                  DataCell(
                    Center(
                      child: Text(
                        SkipassType.type[skipass.mobType] ?? skipass.mobType,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.text_black,
                              fontFamily: 'Raleway',
                            ),
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Text(
                          '${skipass.price.toString().replaceAllMapped(RegExp(r'(?<=\d)(?=(\d{3})+(?!\d))'), (match) => ' ')} р',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: AppColors.text_black,
                                  fontFamily: 'Raleway')),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
