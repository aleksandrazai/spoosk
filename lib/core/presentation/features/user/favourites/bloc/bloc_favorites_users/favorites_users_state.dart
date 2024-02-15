part of 'favorites_users_bloc.dart';

@immutable
sealed class FavoritesUsersState extends Equatable {
  @override
  List<Object> get props => [];
}

final class FavoritesUsersInitial extends FavoritesUsersState {
  @override
  List<Object> get props => [];
}

final class FavoritesUsersAll extends FavoritesUsersState {
  FavoritesUsersAll({required this.resorts});
  final List<Resort>? resorts;

  @override
  List<Object> get props => super.props..add(resorts!);
}
