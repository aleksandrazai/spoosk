import 'package:flutter/material.dart';
import 'package:spoosk/core/data/models/ResortById.dart';

class TabletWidget extends StatefulWidget {
  TabletWidget({Key? key}) : super(key: key);

  @override
  _TabletWidgetState createState() => _TabletWidgetState();
}

class _TabletWidgetState extends State<TabletWidget> {
  final List<Skipass> items = [
    Skipass(mobType: '1', price: '100'),
    Skipass(mobType: '2', price: '200'),
    Skipass(mobType: '3', price: '300'),
    Skipass(mobType: '1', price: '100'),
    Skipass(mobType: '2', price: '200'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: DataTable(
          border: TableBorder.all(width: 0.1),
          headingRowColor: MaterialStatePropertyAll(Color(0xFFBDE3FF)),
          columns: const [
            DataColumn(label: Text('Количество дней')),
            DataColumn(label: Text('Cтоимость от')),
          ],
          rows: items
              .map(
                (Skipass) => DataRow(
                  cells: [
                    DataCell(Center(
                      child: Text(
                        Skipass.mobType,
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        Skipass.price,
                      ),
                    )),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
