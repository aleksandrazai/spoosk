// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/presentation/widgets/resort_card.dart';
import '../../../data/models/resorts.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'request_controller_event.dart';
part 'request_controller_state.dart';

class PorularResortBloc extends Bloc<PorularResortEvent, PorularResortState> {
  RequestController requestController = RequestController();
  PorularResortBloc() : super(PorularResortInitial(resortsAll: [])) {
    on<LoadAllPorularResorts>((event, emit) async {
      await _getPopular();
    });
  }

  _getPopular() async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        final List<Resort>? resorts = await requestController.getResortsAll();
        resorts?.forEach((element) {
          print("element.inFavorites: ${element.inFavorites}");
        });
        final result = resorts!.map((e) => ResortCard(resort: e)).toList();

        print(result);
        if (resorts != null) {
          emit(PorularResortLoaded(resortsAll: result));
        }
      }
    } catch (e) {
      print("Error PorularResortBloc: ${e}");
      emit(PorularResortLoaded(resortsAll: []));
    }
  }
}
