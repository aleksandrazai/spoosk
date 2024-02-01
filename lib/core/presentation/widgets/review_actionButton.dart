import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewActionIcon extends StatelessWidget {
  const ReviewActionIcon(
      {super.key, required this.onTapped, required this.icon});

  final VoidCallback? onTapped;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: SvgPicture.asset(
        colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
        fit: BoxFit.scaleDown,
        icon,
      ),
    );
  }
}
