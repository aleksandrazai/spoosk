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
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
          content: Text(bodyText),
          actions: actions,
        );
      },
    );
  }
}
