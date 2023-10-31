import 'package:flutter/material.dart';

class ReviewButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressedCallback;
  const ReviewButton({
    super.key,
    required this.buttonText,
    required this.onPressedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressedCallback,
      child: Text(buttonText, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
