import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
import 'package:spoosk/core/data/RequestController.dart';
import 'package:spoosk/core/data/models/regions.dart';

part 'region_event.dart';
part 'region_state.dart';

class RegionBloc extends Bloc<RegionEvent, RegionState> {
  RegionBloc() : super(RegionInitial()) {
    RequestController requestController = RequestController();
    on<LoadAllRegions>((event, emit) async {
      try {
        final connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          final List<Regions>? regions = await requestController.getRegionsAll(
              getAllRegions: ApiConfigurate.getAllRegions);
          if (regions!.isNotEmpty) {
            emit(RegionLoaded(regionsAll: regions));
          }
        }
      } catch (e) {
        print("RegionsALL: $e");
      }
    });
  }
}
