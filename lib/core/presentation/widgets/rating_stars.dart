import 'package:flutter/material.dart';
import 'package:spoosk/core/presentation/widgets/star_icon.dart';

class RatingStars extends StatelessWidget {
  final num rating;

  const RatingStars({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        5,
        (index) => StarIcon(filled: index < rating),
      ),
    );
  }
}
