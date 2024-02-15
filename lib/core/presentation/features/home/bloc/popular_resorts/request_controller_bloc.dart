import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/models/resorts.dart';
part 'request_controller_event.dart';
part 'request_controller_state.dart';

class PorularResortBloc extends Bloc<PorularResortEvent, PorularResortState> {
  RequestController requestController = RequestController();
  PorularResortBloc() : super(PorularResortInitial()) {
    on<LoadAllPorularResorts>((event, emit) async {
      try {
        final List<Resort>? resorts = await requestController.getResortsAll();
        if (resorts != null) {
          emit(PorularResortLoaded(resortsAll: resorts));
        }
      } catch (e) {
        emit(PorularResortLoaded(resortsAll: const []));
      }
    });
  }
}
