import 'package:flutter/material.dart';
import 'package:spoosk/core/presentation/widgets/widgets.dart';

class CustomBottomSheet {
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
          return Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.5,
              child: Column(
                children: [const ModalHandle(), ...children],
              ),
            ),
          );
        });
  }
}
