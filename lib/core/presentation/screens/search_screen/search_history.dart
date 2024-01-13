import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/DB/DBController_history_search.dart';
import '../../../data/models/resorts.dart';
import '../../bloc_search_history/search_history_bloc.dart';
import 'search_mini_card.dart';

class SearchHistory extends StatefulWidget {
  const SearchHistory({Key? key}) : super(key: key);

  @override
  _SearchHistoryState createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory> {
  DBController_history_search dbController_history_search =
      DBController_history_search();

  @override
  Widget build(BuildContext context) {
    print("+_+_+_+_+_+_+_+_");
    return BlocBuilder<SearchHistoryBloc, SearchHistoryState>(
      builder: (context, state) {
        final List<Result>? data = state is SearchHistoryDB ? state.data : null;
        print("Воркает ${data?.length}");
        return data != null
            ? SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          style: Theme.of(context).textTheme.labelMedium,
                          'Ранее вы искали'),
                      SizedBox(
                        height: 8,
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: data!.length,
                        itemBuilder: (context, index) =>
                            SearchMiniCard(resort: data[index]),
                      )
                    ]),
              )
            : Container();
      },
    );
  }
}
