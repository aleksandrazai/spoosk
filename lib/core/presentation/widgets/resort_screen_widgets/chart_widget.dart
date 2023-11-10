import 'package:flutter/material.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/chart.dart';

class ChartWidget extends StatefulWidget {
  Chart chartData;
  ChartWidget({Key? key, required this.chartData}) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  @override
  Widget build(BuildContext context) {
    final total = widget.chartData.easy +
        widget.chartData.medium +
        widget.chartData.hard +
        widget.chartData.veryHard;
    final screenWidth = MediaQuery.of(context).size.width - 24;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildLegendItem(AppColors.chart_green, 'Легкие'),
                  _buildLegendItem(AppColors.chart_blue, 'Средней сложности'),
                  _buildLegendItem(AppColors.chart_pink, 'Сложные'),
                  _buildLegendItem(AppColors.chart_black, 'Очень сложные'),
                ],
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 16),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Row(
            children: [
              _buildContainer(AppColors.chart_green, widget.chartData.easy,
                  total, screenWidth),
              _buildContainer(AppColors.chart_blue, widget.chartData.medium,
                  total, screenWidth),
              _buildContainer(AppColors.chart_pink, widget.chartData.hard,
                  total, screenWidth),
              _buildContainer(AppColors.chart_black, widget.chartData.veryHard,
                  total, screenWidth),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Text(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.icons_active_blue),
              "Смотреть карту курорта"),
        )
      ],
    );
  }

  Widget _buildContainer(
      Color color, int value, int total, double screenWidth) {
    return Container(
        width: (value / total) * screenWidth,
        color: color,
        height: 24,
        child: Center(
          child: Text(
            value.toString(),
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: AppColors.white,
                ),
          ),
        ));
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: ShapeDecoration(
            color: color,
            shape: const OvalBorder(),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 7, right: 10),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
