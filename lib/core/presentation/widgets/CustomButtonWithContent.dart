import 'package:flutter/material.dart';
import '../../colors.dart';

class CustomButtonFilter extends StatefulWidget {
  String text;
  Widget? icon;
  EdgeInsetsGeometry? margin;
  double? spasing;
  bool currentSelected;
  // int? id;
  VoidCallback onPress;

  CustomButtonFilter({
    super.key,
    required this.text,
    required this.onPress,
    this.icon,
    this.margin,
    this.spasing,
    // this.id,
    this.currentSelected = false,
  });

  @override
  _CustomButtonFilterState createState() => _CustomButtonFilterState();
}

class _CustomButtonFilterState extends State<CustomButtonFilter> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onPress();
        });
      },
      child: Container(
        margin: widget.margin,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.currentSelected
                ? AppColors.icons_active_blue
                : AppColors.icons_not_Active_gray,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null) ...[
              widget.icon!,
            ],
            SizedBox(
              width: widget.spasing ?? 0,
            ),
            Text(
              widget.text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.icons_active_blue,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
