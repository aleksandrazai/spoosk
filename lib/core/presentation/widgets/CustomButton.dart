import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  num? height;
  num? width;
  EdgeInsetsGeometry? margin;
  Color? color;
  String? buttonText;
  TextStyle? textStyle;
  BoxDecoration? boxDecoration;
  void Function()? onTap;

  CustomButton(
      {super.key,
      this.margin,
      this.boxDecoration,
      required this.buttonText,
      this.textStyle,
      this.height,
      this.width,
      required this.color,
      required this.onTap});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap!();
      },
      child: Container(
        margin: widget.margin,
        decoration: widget.boxDecoration?.copyWith(color: widget.color),
        // color: widget.boxDecoration != null ? null : widget.color,
        height: widget.height?.toDouble(),
        width: widget.width?.toDouble() ?? double.infinity,
        child: Center(
          child: Text(style: widget.textStyle, "${widget.buttonText}"),
        ),
      ),
    );
  }
}
