part of 'favorites_users_bloc.dart';

@immutable
sealed class FavoritesUsersEvent {}

class FavoritesUsersGet extends FavoritesUsersEvent {
  late int userId;
  FavoritesUsersGet({required this.userId});
}
