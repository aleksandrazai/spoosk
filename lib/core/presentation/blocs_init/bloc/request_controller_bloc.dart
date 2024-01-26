import 'package:bloc/bloc.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import '../../../data/API/ApiConfig.dart';
import '../../../data/models/resorts.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'request_controller_event.dart';
part 'request_controller_state.dart';

class PorularResortBloc extends Bloc<PorularResortEvent, PorularResortState> {
  RequestController requestController = RequestController();
  PorularResortBloc() : super(PorularResortInitial()) {
    on<LoadAllPorularResorts>((event, emit) async {
      try {
        final connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          final List<Resort>? resorts = await requestController.getResortsAll();
          if (resorts != null) {
            emit(PorularResortLoaded(resortsAll: resorts));
          }
        }
      } catch (e) {
        emit(PorularResortLoaded(resortsAll: []));
      }
    });
  }
}
