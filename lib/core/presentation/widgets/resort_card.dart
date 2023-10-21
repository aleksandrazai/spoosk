import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/data/models/resorts.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/widgets/star_icon.dart';
import 'custom_cardimage.dart';

class ResortCard extends StatelessWidget {
  const ResortCard({
    super.key,
    required this.resort,
  });
  final Resorts resort;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCardImage(resort: resort),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              width: null,
              height: null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    resort.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const StarIcon(),
                  //rating нет в API
                  Text(
                    '5.0',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  //reviews нет в API
                  Text(
                    '(278)',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'РОССИЯ, ${resort.region}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                width: 190,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(image_trail, height: 18, width: 18),
                    Text(
                      '${resort.trailLength} км.',
                      style: const TextStyle(
                        color: Color(0xFF4C4E4F),
                        fontSize: 14,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SvgPicture.asset(image_skipass, height: 18, width: 18),
                    Text(
                      'от ${resort.skipass.toString()} р.',
                      style: const TextStyle(
                        color: Color(0xFF4C4E4F),
                        fontSize: 14,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
