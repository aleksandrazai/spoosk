import 'package:flutter/material.dart';

class ModalHandle extends StatelessWidget {
  const ModalHandle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Opacity(
            opacity: 0.40,
            child: Container(
              width: 32,
              height: 4,
              decoration: ShapeDecoration(
                color: const Color(0xFF79747E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
