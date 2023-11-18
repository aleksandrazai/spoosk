import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/colors.dart';

class CustomButtonFilter extends StatefulWidget {
  String text;
  Widget? icon;
  EdgeInsetsGeometry? margin;

  CustomButtonFilter({Key? key, required this.text, this.icon, this.margin})
      : super(key: key);

  @override
  _CustomButtonFilterState createState() => _CustomButtonFilterState();
}

class _CustomButtonFilterState extends State<CustomButtonFilter> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object");
        setState(() {
          isActive = !isActive;
        });
      },
      child: Container(
        margin: widget.margin,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: isActive
                ? AppColors.icons_active_blue
                : AppColors.icons_not_Active_gray,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null) ...[
              widget.icon!,
            ],
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
