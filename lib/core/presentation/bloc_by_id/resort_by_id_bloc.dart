import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:spoosk/core/data/ApiConfig.dart';
import 'package:spoosk/core/data/RequestController.dart';
import 'package:spoosk/core/data/models/ResortById.dart';

part 'resort_by_id_event.dart';
part 'resort_by_id_state.dart';

class ResortByIdBloc extends Bloc<ResortByIdEvent, ResortByIdState> {
  ResortByIdBloc() : super(ResortByIdInitial()) {
    RequestController requestController = RequestController();

    on<EventClearByIdResort>((event, emit) {
      emit(ResortByIdLoaded(resortById: null));
    });

    on<EventLoadByIdResort>((event, emit) async {
      try {
        final connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          final ResortById? resort = await requestController.getResortsById(
              id: event.idResort,
              getResotrsById: ApiConfigurate.getResotrsById);

          if (resort != null) {
            emit(ResortByIdLoaded(resortById: resort));
          }
        }
      } catch (e) {
        print("ResortByIdBloc: $e");
      }
    });
  }
}
