import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../image.dart';

class StarIcon extends StatelessWidget {
  final bool filled;

  const StarIcon({
    super.key,
    required this.filled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SvgPicture.asset((filled ? image_star : image_gray_star),
          height: 14, width: 14),
    );
  }
}
