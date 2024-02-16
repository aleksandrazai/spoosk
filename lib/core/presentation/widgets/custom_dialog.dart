import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spoosk/core/colors.dart';

class CustomDialog {
  static showCustomDialog(
      {required BuildContext context,
      required String title,
      required String bodyText,
      required List<Widget> actions}) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.white,
          title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
          content: Text(bodyText),
          actions: actions,
        );
      },
    );
  }

  static closeCustomDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
