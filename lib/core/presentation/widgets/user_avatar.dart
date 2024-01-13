import 'package:flutter/material.dart';
import 'package:spoosk/core/presentation/image.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      width: 104,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(84),
        ),
      ),
      child: Image.asset(image_avatar_placeholder, fit: BoxFit.cover),
    );
  }
}
