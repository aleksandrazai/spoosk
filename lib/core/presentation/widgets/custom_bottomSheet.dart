import 'package:flutter/material.dart';
import 'package:spoosk/core/colors.dart';

class CustomBottomSheet {
  static customShowModalBottomSheet(
      {required BuildContext context,
      required List<Widget> children,
      double? height}) {
    return showModalBottomSheet(
        showDragHandle: true,
        useSafeArea: true,
        useRootNavigator: true,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
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
                  children: [...children],
                ),
              ),
            ),
          );
        });
  }

  static closeModalBottomSheet(BuildContext context) {
    Navigator.of(context).pop();
  }
}
