import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  Color color;
  double? width;
  double? height;

  CustomCircle({super.key, required this.color, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10 / 2))),
      width: width ?? 10,
      height: height ?? 10,
    );
  }
}
