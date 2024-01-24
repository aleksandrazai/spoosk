import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/API/ApiConfig.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import '../../data/models/resorts.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchResortBloc extends Bloc<SearchResortEvent, SearchResortState> {
  SearchResortBloc() : super(SearchResortInitial()) {
    on<SearchTextInput>(_onTextSubmitted);
    on<ClearText>(_onTextCleared);
  }

  void _onTextSubmitted(
      SearchTextInput event, Emitter<SearchResortState> emit) async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      RequestController requestController = RequestController();
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        final List<Resort>? resorts = await requestController.searchResort(
            searchResort: ApiConfigurateGet.getAllResorts,
            text: event.searchText);

        if (resorts!.isNotEmpty) {
          print('Resorts found: ${resorts.length}');
          emit(SearchResortLoaded(resortsFound: resorts));
        } else {
          print('No resorts found');
          emit(SearchResortNotFound());
        }
      }
    } catch (e) {
      print('\x1B[31m${e}\x1B[0m');
      emit(SearchResortNotFound());
    }
  }

  void _onTextCleared(ClearText event, Emitter<SearchResortState> emit) {
    emit(SearchResortInitial());
  }
}
