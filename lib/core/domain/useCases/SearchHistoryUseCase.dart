import 'package:spoosk/core/data/DB/DBController_history_search.dart';
import 'package:spoosk/core/data/models/ResortById.dart';
import 'package:spoosk/core/data/models/resorts.dart';
import 'package:spoosk/core/presentation/bloc_search/search_bloc.dart';
import 'package:spoosk/core/presentation/bloc_search_history/search_history_bloc.dart';

class SearchHistoryUseCase {
  DBController_history_search dbController_history_search =
      DBController_history_search();

  SearchHistoryUseCase();

  void checkDB(SearchHistoryBloc searchResortBloc) async {
    final List<Result> result = await _checkDB();
    searchResortBloc.add(SearchResortHistory(history: result));
  }

  Future<List<Result>> _checkDB() async {
    await dbController_history_search.initDatabase();
    try {
      return await dbController_history_search.getDataList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
