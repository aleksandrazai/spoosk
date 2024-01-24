import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../colors.dart';
import '../../../data/models/resorts.dart';
import '../../bloc_by_id/resort_by_id_bloc.dart';
import '../../bloc_reviews_by_id/reviews_by_id_bloc.dart';
import '../../bloc_search/search_bloc.dart';
import '../../routes.gr.dart';

import '../../../data/DB/DBController_history_search.dart';

class SearchMiniCard extends StatelessWidget {
  final Resort resort;

  const SearchMiniCard({super.key, required this.resort});

  @override
  Widget build(BuildContext context) {
    DBController_history_search dbController_history_search =
        DBController_history_search();

    return GestureDetector(
      onTap: () {
        context
            .read<ReviewsByIdBloc>()
            .add(EventLoadByIdReviews(idResort: resort.idResort));
        context
            .read<ResortByIdBloc>()
            .add(EventLoadByIdResort(idResort: resort.idResort));
        _insert(dbController_history_search);
        context.router.push(ResortRoute(idResort: resort.idResort));

        context.read<SearchResortBloc>().add(ClearText());
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
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.close_rounded),
                  ),
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

  _insert(DBController_history_search dbController_history_search) async {
    await dbController_history_search.insert(resort);
  }
}
