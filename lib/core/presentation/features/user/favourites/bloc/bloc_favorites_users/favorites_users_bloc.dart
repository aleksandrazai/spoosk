// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:spoosk/core/data/API/RequestController.dart';
import 'package:spoosk/core/data/models/resorts.dart';
import 'package:spoosk/core/data/repositories/DI/service.dart';

part 'favorites_users_event.dart';
part 'favorites_users_state.dart';

class FavoritesUsersBloc
    extends Bloc<FavoritesUsersEvent, FavoritesUsersState> {
  final RequestController _requestController = RequestController();
  SingletonAuthUseCase authUseCase = SingletonAuthUseCase();

  FavoritesUsersBloc() : super(FavoritesUsersInitial()) {
    on<FavoritesUsersGet>(_getFavourites);
  }

  void _getFavourites(
      FavoritesUsersGet event, Emitter<FavoritesUsersState> emit) async {
    try {
      final List<Resort>? addedFavoritesList =
          await _requestController.getAddedFavorites(
              userId: event.userId,
              userToken: authUseCase.authUseCase.userToken!);
      emit(FavoritesUsersAll(resorts: addedFavoritesList));
    } catch (e) {
      print("ReviewsByIdBloc: $e");
    }
  }
}
