import 'package:flutter/material.dart';
import 'package:spoosk/core/colors.dart';

class HideTextOverflow extends StatefulWidget {
  const HideTextOverflow({
    super.key,
    required this.fullText,
    required this.maxSymbols,
  });

  final String fullText;
  final int maxSymbols;

  @override
  State<HideTextOverflow> createState() => _HideTextOverflowState();
}

class _HideTextOverflowState extends State<HideTextOverflow> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.fullText.isNotEmpty
            ? Text(
                isExpanded
                    ? widget.fullText
                    : widget.fullText.substring(0, widget.maxSymbols),
                maxLines: isExpanded ? null : widget.maxSymbols,
                overflow:
                    isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            : const Text(''),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: widget.fullText.isNotEmpty
              ? Text(
                  isExpanded ? "Свернуть" : "Показать полностью",
                  style: TextStyle(color: AppColors.primaryColor),
                )
              : null,
        ),
      ],
    );
  }
}
