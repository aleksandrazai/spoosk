import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:spoosk/core/data/API/ApiConfig.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/models/ResortById.dart';

part 'resort_by_id_event.dart';
part 'resort_by_id_state.dart';

class ResortByIdBloc extends Bloc<ResortByIdEvent, ResortByIdState> {
  ResortByIdBloc() : super(ResortByIdInitial()) {
    RequestController requestController = RequestController();
    on<EventClearByIdResort>(_onEventCleared);
    on<EventLoadByIdResort>((event, emit) async {
      try {
        final connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          final ResortById? resort = await requestController.getResortsById(
              id: event.idResort,
              getResotrsById: ApiConfigurateGet.getResotrsById);

          if (resort != null) {
            emit(ResortByIdLoaded(resortById: resort));
          }
        }
      } catch (e) {
        print("ResortByIdBloc: $e");
      }
    });
  }

  void _onEventCleared(
      EventClearByIdResort event, Emitter<ResortByIdState> emit) {
    emit(ResortByIdInitial());
  }
}
