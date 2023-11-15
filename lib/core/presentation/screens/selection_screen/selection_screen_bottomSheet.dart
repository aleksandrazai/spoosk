import 'package:flutter/material.dart';
import 'package:spoosk/core/presentation/widgets/custom_searchfield.dart';

class CustomBottomSheetRegion {
  static show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: CustomSearchField(),
      ),
    );
  }
}
