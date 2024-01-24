part of 'favorites_users_bloc.dart';

@immutable
sealed class FavoritesUsersState {}

final class FavoritesUsersInitial extends FavoritesUsersState {}

final class FavoritesUsersAll extends FavoritesUsersState {
  late List<Resort>? resorts;
  FavoritesUsersAll({required this.resorts});
}
