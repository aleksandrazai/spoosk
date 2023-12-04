import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
import 'package:spoosk/core/data/RequestController.dart';
import 'package:spoosk/core/data/models/resorts.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchResortBloc extends Bloc<SearchResortEvent, SearchResortState> {
  RequestController requestController = RequestController();
  SearchResortBloc() : super(SearchResortInitial()) {
    on<SearchTextInput>((event, emit) async {
      try {
        final connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          final List<Result>? resorts = await requestController.searchResort(
              searchResort: ApiConfigurate.getAllResorts,
              text: event.searchText);

          if (resorts!.isNotEmpty) {
            emit(SearchResortLoaded(resortsFound: resorts));
          }
        }
      } catch (e) {
        emit(SearchResortLoaded(resortsFound: []));
      }
    });
  }
}
