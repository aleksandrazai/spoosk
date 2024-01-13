import 'package:bloc/bloc.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import '../../../data/API/ApiConfig.dart';
import '../../../data/models/resorts.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'request_controller_event.dart';
part 'request_controller_state.dart';

class RequestControllerBloc
    extends Bloc<RequestControllerEvent, RequestControllerState> {
  RequestController requestController = RequestController();
  RequestControllerBloc() : super(RequestControllerInitial()) {
    on<LoadAllResorts>((event, emit) async {
      try {
        final connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          final List<Result>? resorts = await requestController.getResortsAll(
              getAllResorts: ApiConfigurateGet.getAllResorts);

          if (resorts!.isNotEmpty) {
            emit(RequestControllerLoaded(resortsAll: resorts));
          }
        }
      } catch (e) {
        emit(RequestControllerLoaded(resortsAll: []));
      }
    });
  }
}
