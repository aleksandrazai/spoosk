import 'package:bloc/bloc.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
import 'package:spoosk/core/data/RequestController.dart';
import 'package:spoosk/core/data/models/resorts.dart';

part 'request_controller_event.dart';
part 'request_controller_state.dart';

class RequestControllerBloc
    extends Bloc<RequestControllerEvent, RequestControllerState> {
  RequestController requestController = RequestController();
  RequestControllerBloc() : super(RequestControllerInitial()) {
    on<LoadAllResorts>((event, emit) async {
      try {
        final resorts = await requestController.getResortsAll(
            getAllResorts: ApiConfigurate.getAllResorts);

        if (resorts!.isNotEmpty) {
          emit(RequestControllerLoaded(resortsAll: resorts));
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
