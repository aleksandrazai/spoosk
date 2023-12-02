import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/data/models/ResortById.dart';
import 'package:spoosk/core/presentation/image.dart';

class AdditionalList extends StatelessWidget {
  AdditionalList({super.key, required this.resortById});

  ResortById? resortById;

  Widget buildAdditional(String text, num state) {
    bool isChecked = state == 1;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          isChecked ? image_check_blue : image_check_gray,
          height: 18,
          width: 18,
          fit: BoxFit.scaleDown,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(text),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildAdditional('Пункты проката', resortById!.equipRental),
        const SizedBox(height: 16),
        buildAdditional('Горнолыжные школы', resortById!.school),
        const SizedBox(height: 16),
        buildAdditional('Вечернее катание', resortById!.eveningSkiing),
        const SizedBox(height: 16),
        buildAdditional('Сноупарк', resortById!.snowpark),
        const SizedBox(height: 16),
        buildAdditional('Зоны для фрирайда', resortById!.freeride),
      ],
    );
  }
}
