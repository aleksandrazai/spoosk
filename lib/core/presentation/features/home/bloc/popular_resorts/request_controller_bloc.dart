import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/models/resorts.dart';
import 'package:spoosk/core/data/repositories/DI/service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'request_controller_event.dart';
part 'request_controller_state.dart';

class PorularResortBloc extends Bloc<PorularResortEvent, PorularResortState> {
  RequestController requestController = RequestController();
  SingletonAuthUseCase authUseCase = SingletonAuthUseCase();
  PorularResortBloc() : super(PorularResortInitial()) {
    on<LoadAllPorularResorts>((event, emit) async {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        try {
          final List<Resort>? resorts = await requestController
              .getResortsAll(authUseCase.authUseCase.userToken);
          if (resorts != null) {
            emit(PorularResortLoaded(resortsAll: resorts));
          }
        } catch (e) {
          emit(PorularResortLoaded(resortsAll: const []));
        }
      }
    });
  }
}
