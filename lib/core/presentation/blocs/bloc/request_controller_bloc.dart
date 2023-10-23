import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
import 'package:spoosk/core/data/RequestController.dart';
import 'package:spoosk/core/data/models/resorts.dart';

part 'request_controller_event.dart';
part 'request_controller_state.dart';

class RequestControllerBloc
    extends Bloc<RequestControllerEvent, RequestControllerInitialState> {
  RequestController requestController = RequestController();
  RequestControllerBloc()
      : super(RequestControllerInitialState(resortsAll: [])) {
    on<InitializeDataEvent>((event, emit) async {
      try {
        final resorts = await requestController.getResortsAll(
            getAllResorts: ApiConfigurate.getAllResorts);

        if (resorts != null) {
          emit(RequestControllerInitialState(resortsAll: resorts));
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
