import 'package:flutter/material.dart';
import 'package:spoosk/core/presentation/widgets/widgets.dart';

class CustomBottomSheetRegion {
  static show(BuildContext context, List<Widget> children) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: Column(
              children: [ModalHandle(), ...children],
            ),
          );
        });
  }
}
