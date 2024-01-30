// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/models/resorts.dart';
import 'package:spoosk/core/presentation/widgets/resort_card.dart';

part 'favorites_users_event.dart';
part 'favorites_users_state.dart';

class FavoritesUsersBloc
    extends Bloc<FavoritesUsersEvent, FavoritesUsersState> {
  final RequestController _requestController = RequestController();
  FavoritesUsersBloc() : super(FavoritesUsersInitial()) {
    on<FavoritesUsersGet>((event, emit) async {
      print("INITIAL: ${event.userId}");
      _getFavotis(event);
    });
  }
  _getFavotis(FavoritesUsersGet event) async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        final List<Resort>? addedFavoritesList =
            await _requestController.getAddedFavorites(userId: event.userId);
        final result =
            addedFavoritesList!.map((e) => ResortCard(resort: e)).toList();
        emit(FavoritesUsersAll(
            resortsWidget: result, resorts: addedFavoritesList));
      }
    } catch (e) {
      print("ERROR FavoritesUsersBloc: $e");
    }
  }
}
