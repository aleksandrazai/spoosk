import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/src/response.dart';
import 'package:meta/meta.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/models/resorts.dart';

part 'favorites_users_event.dart';
part 'favorites_users_state.dart';

class FavoritesUsersBloc
    extends Bloc<FavoritesUsersEvent, FavoritesUsersState> {
  FavoritesUsersBloc() : super(FavoritesUsersInitial()) {
    RequestController _requestController = RequestController();

    on<FavoritesUsersEvent>((event, emit) {});
    on<FavoritesUsersGet>((event, emit) async {
      try {
        final connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          final List<Resort>? addedFavoritesList =
              await _requestController.getAddedFavorites(userId: event.userId);
          emit(FavoritesUsersAll(resorts: addedFavoritesList));
        }
      } catch (e) {
        print("ReviewsByIdBloc: $e");
      }
    });
  }
}
