import 'package:flutter/material.dart';

// Просто линия серого цвета
class Separator extends StatefulWidget {
  const Separator({Key? key}) : super(key: key);

  @override
  _SeparatorState createState() => _SeparatorState();
}

class _SeparatorState extends State<Separator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFFD9D9D9),
          ),
        ),
      ),
    );
  }
}
