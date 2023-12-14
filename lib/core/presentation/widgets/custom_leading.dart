import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/presentation/image.dart';

class CustomLeadingIcon extends StatelessWidget {
  const CustomLeadingIcon({super.key, required this.onTapped});

  final VoidCallback? onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: SvgPicture.asset(
        fit: BoxFit.scaleDown,
        image_arrow_left,
        width: 9.33,
        height: 16.33,
      ),
    );
  }
}
