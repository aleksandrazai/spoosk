import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/presentation/image.dart';

class StarIcon extends StatelessWidget {
  const StarIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image_star, width: 14, height: 14);
  }
}
