import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../image.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          width: MediaQuery.of(context).size.width - 32,
          height: 150,
          top: 20,
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(test_png_header, fit: BoxFit.fill, height: 160),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width * 0.9,
          top: 32,
          child: SvgPicture.asset(image_header_slogan, fit: BoxFit.contain),
        ),
        Positioned(
          top: 28,
          right: 25 * 2.13,
          child: Image.asset(
            image_header_logo,
            width: 50,
            height: 16,
          ),
        ),
      ],
    );
  }
}
