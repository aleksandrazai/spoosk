import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc_search/search_bloc.dart';
import 'search_history.dart';
import 'search_mini_card.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({
    super.key,
    required this.state,
  });
  final SearchResortState state;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  late final SearchResortBloc searchResortBloc;

  @override
  void initState() {
    super.initState();
    searchResortBloc = context.read<SearchResortBloc>();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state is SearchResortLoaded) {
      return ListView.builder(
        itemCount: widget.state.resortsFound.length,
        itemBuilder: (context, index) {
          final resort = widget.state.resortsFound[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SearchMiniCard(resort: resort),
          );
        },
      );
    }
    if (widget.state is SearchResortNotFound) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
              'К сожалению, ничего не найдено. \nПопробуйте изменить запрос, и мы поищем еще раз.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600)),
          const SearchHistory()
        ],
      );
    }
    return const SearchHistory();
  }
}
