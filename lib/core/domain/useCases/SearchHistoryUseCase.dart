import 'package:spoosk/core/presentation/features/search/bloc/bloc_search_history/search_history_bloc.dart';

import '../../data/DB/DBController_history_search.dart';
import '../../data/models/resorts.dart';

class SearchHistoryUseCase {
  // ignore: non_constant_identifier_names
  DBController_history_search dbController_history_search =
      DBController_history_search();

  SearchHistoryUseCase();

  void checkDB(SearchHistoryBloc searchResortBloc) async {
    final List<Resort> result = await _checkDB();
    searchResortBloc.add(SearchResortHistory(history: result));
  }

  Future<List<Resort>> _checkDB() async {
    await dbController_history_search.initDatabase();
    try {
      return await dbController_history_search.getDataList();
    } catch (e) {
      return [];
    }
  }
}
