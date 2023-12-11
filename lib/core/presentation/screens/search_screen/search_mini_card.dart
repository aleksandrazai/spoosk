import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/colors.dart';
import 'package:spoosk/core/data/models/resorts.dart';
import 'package:spoosk/core/presentation/bloc_by_id/resort_by_id_bloc.dart';
import 'package:spoosk/core/presentation/bloc_reviews_by_id/reviews_by_id_bloc.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';

class SearchMiniCard extends StatelessWidget {
  const SearchMiniCard({super.key, required this.resort});

  final Result resort;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<ReviewsByIdBloc>()
            .add(EventLoadByIdReviews(idResort: resort.idResort));
        context
            .read<ResortByIdBloc>()
            .add(EventLoadByIdResort(idResort: resort.idResort));
        print('id resort: ${resort.idResort}');
        context.router.push(ResortRoute(idResort: resort.idResort));
      },
      child: Card(
        elevation: 0,
        color: AppColors.scaffoldBackgroundLight,
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  resort.image,
                  height: 58,
                  width: 58,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resort.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'РОССИЯ, ${resort.region}'.toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xFF9B9CA0),
                        fontSize: 10,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
