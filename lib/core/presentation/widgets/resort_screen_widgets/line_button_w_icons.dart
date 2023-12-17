import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/presentation/image.dart';

class LineButtonWithIcons extends StatelessWidget {
  LineButtonWithIcons(
      {super.key,
      required this.onTap,
      required this.imageName,
      required this.text,
      this.color,
      this.margin});
  final void Function() onTap;
  final String imageName;
  final String text;
  final Color? color;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: margin,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: AppColors.blue_light,
          onTap: () {
            onTap();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Center(child: SvgPicture.asset(color: color, imageName)),
              ),
              const SizedBox(
                width: 22,
              ),
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: double.infinity),
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.text_black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                  child: SvgPicture.asset(
                      color: AppColors.blue_light, image_arrow_left),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
