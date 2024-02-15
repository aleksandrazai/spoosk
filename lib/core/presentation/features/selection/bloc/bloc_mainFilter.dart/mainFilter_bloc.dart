import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/models/resorts.dart';

part 'mainFilter_event.dart';
part 'mainFilter_state.dart';

class MainFilterBloc extends Bloc<MainFilterEvent, MainFilterState> {
  MainFilterBloc() : super(MainFilterInitial()) {
    RequestController requestController = RequestController();

    on<MainFilterRequest>((event, emit) async {
      try {
        final connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          final List<Resort>? resorts = await requestController.getMainFilter(
            resort_region: event.resort_region,
            resort_month: event.resort_month,
            resort_level: event.resort_level,
            advancedFilter: event.group_button,
            slider: event.slider,
          );
          if (resorts != null && resorts.isNotEmpty) {
            emit(MainFilterLoaded(resortsMainFilter: resorts));
          } else {
            emit(MainFilterNotFound());
          }
        }
      } catch (e) {
        print("Resorts: $e");
      }
    });
  }
}
