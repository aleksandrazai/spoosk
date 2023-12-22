import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spoosk/core/data/models/resorts.dart';

part 'search_history_event.dart';
part 'search_history_state.dart';

class SearchHistoryBloc extends Bloc<SearchHistoryEvent, SearchHistoryState> {
  SearchHistoryBloc() : super(SearchHistoryInitial(resortsFound: [])) {
    on<SearchResortHistory>(
      (SearchResortHistory event, emit) {
        if (event.history.isNotEmpty) {
          emit(SearchHistoryDB(data: event.history));
          print('Resorts found: ${event.history.length}');
        } else {
          print('No resorts found');
        }
      },
    );
  }
}
