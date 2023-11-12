import 'package:flutter/material.dart';

class ReviewButton extends StatelessWidget {
  const ReviewButton(
      {super.key, required this.onPressedCallback, required this.buttonText});
  final VoidCallback? onPressedCallback;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressedCallback,
      child: Text(buttonText),
    );
  }
}
