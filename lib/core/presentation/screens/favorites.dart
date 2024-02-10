import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/presentation/bloc_favorites_users/favorites_users_bloc.dart';
import 'package:spoosk/core/presentation/bloc_user_by_id/user_bloc.dart';
import 'package:spoosk/core/presentation/screens/auth/login.dart';
import 'package:spoosk/core/presentation/widgets/resort_card.dart';

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
      context
          .read<FavoritesUsersBloc>()
          .add(FavoritesUsersGet(userId: userId!));
    }
  }

  @override
  void didInitTabRoute(TabPageRoute? previousRoute) async {
    UserProfileBloc userBloc = context.read<UserProfileBloc>();
    int? userId = userBloc.getUserId();
    print("didInitTabRoute userBloc.userId: $userId");

    if (userId != null) {
      setState(() {
        isAuth = true;
      });
      context.read<FavoritesUsersBloc>().add(FavoritesUsersGet(userId: userId));
    }
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    UserProfileBloc userBloc = context.read<UserProfileBloc>();
    int? userId = userBloc.getUserId();

    print("didChangeTabRoute userBloc.userId: ${userId}");
    if (userId != null) {
      setState(() {
        isAuth = true;
      });
      context.read<FavoritesUsersBloc>().add(FavoritesUsersGet(userId: userId));
    } else if (userId == null) {
      setState(() {
        isAuth = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    UserProfileBloc userBloc = context.read<UserProfileBloc>();
    int? userId = userBloc.getUserId();

    print("Widget build $userId");
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFFf8f8f8),
            elevation: 0,
            title: Text(
              'Избранное',
              style: Theme.of(context).textTheme.headlineMedium,
            )),
        body: BlocBuilder<FavoritesUsersBloc, FavoritesUsersState>(
          builder: (context, state) {
            if (userId == null && isAuth == false) {
              return const LoginScreen();
            }
            if (state is FavoritesUsersAll && state.resorts != null) {
              return ListView.builder(
                itemCount: state.resorts!.length,
                itemBuilder: (context, index) {
                  final resort = state.resorts![index];
                  return ResortCard(resort: resort);
                },
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
        ));
  }
}
