import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoosk/core/data/models/resorts.dart';
import 'package:spoosk/core/presentation/bloc_by_id/resort_by_id_bloc.dart';
import 'package:spoosk/core/presentation/image.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';
import 'package:spoosk/core/presentation/widgets/star_icon.dart';
import 'custom_cardimage.dart';

class ResortCard extends StatelessWidget {
  const ResortCard({
    super.key,
    required this.resort,
  });
  final Result resort;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Card tapped');
        context
            .read<ResortByIdBloc>()
            .add(EventLoadByIdResort(idResort: resort.idResort));
        print('id resort: ${resort.idResort}');
        context.router.push(ResortRoute(idResort: resort.idResort));
      },
      child: Card(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      resort.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: StarIcon(),
                    ),
                    //rating нет в API
                    Text(
                      '5,0',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    //reviews нет в API
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        '(278)',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 6),
              child: Text(
                'РОССИЯ, ${resort.region}'.toUpperCase(),
                style: const TextStyle(
                  color: Color(0xFF9B9CA0),
                  fontSize: 10,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 4, 8, 4),
                      child:
                          SvgPicture.asset(image_trail, height: 18, width: 18),
                    ),
                    Text(
                      '${resort.trailLength} км.',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                      child: SvgPicture.asset(image_skipass,
                          height: 18, width: 18),
                    ),
                    Text(
                      'от ${resort.skipass.toString()} р.',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
