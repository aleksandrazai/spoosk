import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spoosk/core/presentation/features/auth/login/view/login.dart';
import 'package:spoosk/core/presentation/features/user/favourites/bloc/bloc_favorites_users/favorites_users_bloc.dart';
import 'package:spoosk/core/presentation/features/user/profile/bloc_user_by_id/user_bloc.dart';
import 'package:spoosk/core/presentation/features/resort/widgets/resort_card/resort_card.dart';

@RoutePage()
class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites>
    with AutoRouteAwareStateMixin<Favorites> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    UserProfileBloc userBloc = context.read<UserProfileBloc>();
    int? userId = userBloc.getUserId();
    if (userId != null) {
      context.read<FavoritesUsersBloc>().add(FavoritesUsersGet(userId: userId));
    }
  }

  @override
  Widget build(BuildContext context) {
    UserProfileBloc userBloc = context.read<UserProfileBloc>();
    int? userId = userBloc.getUserId();
    return BlocListener<UserProfileBloc, UserProfileState>(
      listener: (context, state) {
        if (state is UserProfileLoaded) {
          setState(() {
            isAuth = true;
          });
        }
        if (state is UserProfileInitial) {
          setState(() {
            isAuth = false;
          });
        }
      },
      child: BlocBuilder<FavoritesUsersBloc, FavoritesUsersState>(
        builder: (context, state) {
          if (userId == null && isAuth == false) {
            return const LoginScreen();
          }
          if (state is FavoritesUsersAll && state.resorts != null) {
            return Scaffold(
              appBar: AppBar(
                  backgroundColor: const Color(0xFFf8f8f8),
                  elevation: 0,
                  title: Text(
                    'Избранное',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )),
              body: ListView.builder(
                itemCount: state.resorts!.length,
                itemBuilder: (context, index) {
                  final resort = state.resorts![index];
                  return ResortCard(resort: resort);
                },
              ),
            );
          }
          if (state is FavoritesUsersAll &&
              state.resorts != null &&
              state.resorts!.isEmpty) {
            return const Center(
              child: Text("Список пуст"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
