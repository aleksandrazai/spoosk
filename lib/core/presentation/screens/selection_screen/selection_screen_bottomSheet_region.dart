import 'package:flutter/material.dart';
import 'package:spoosk/core/presentation/widgets/custom_searchfield.dart';

class SelectionScreenBottomSheetRegion extends StatefulWidget {
  const SelectionScreenBottomSheetRegion({Key? key}) : super(key: key);

  @override
  _SelectionScreenBottomSheetRegionState createState() =>
      _SelectionScreenBottomSheetRegionState();
}

class _SelectionScreenBottomSheetRegionState
    extends State<SelectionScreenBottomSheetRegion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
                style: Theme.of(context).textTheme.headlineMedium,
                "В каком регионе вы хотите покататься?"),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomSearchField(),
      ],
    );
  }
}
