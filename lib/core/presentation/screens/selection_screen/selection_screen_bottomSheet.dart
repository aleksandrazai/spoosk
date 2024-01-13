import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class CustomBottomSheet {
  static customShowModalBottomSheet(
      {required BuildContext context,
      required List<Widget> children,
      double? height}) {
    return showModalBottomSheet(
        useSafeArea: true,
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
              height: height,
              child: SingleChildScrollView(
                child: Column(
                  children: [const ModalHandle(), ...children],
                ),
              ),
            ),
          );
        });
  }
}
