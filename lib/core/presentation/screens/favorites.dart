import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoosk/core/presentation/bloc_favorites_users/favorites_users_bloc.dart';
import 'package:spoosk/core/presentation/widgets/resort_card.dart';
import 'package:spoosk/core/utils/context.dart';

@RoutePage()
class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites>
    with AutoRouteAwareStateMixin<Favorites> {
  int? _auth;

  @override
  void didInitTabRoute(TabPageRoute? previousRoute) async {
    print("didInitTabRoute  ${context.userInfo.userId}");
    setState(() {
      _auth = context.userInfo.userId;
    });

    if (context.userInfo.userId != null) {
      context
          .read<FavoritesUsersBloc>()
          .add(FavoritesUsersGet(userId: context.userInfo.userId!.toInt()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState _FavoritesState: ${context.userInfo}");
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    if (context.userInfo.userId != null) {
      context
          .read<FavoritesUsersBloc>()
          .add(FavoritesUsersGet(userId: context.userInfo.userId!));
    }
  }

  @override
  Widget build(BuildContext context) {
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
            print(state is FavoritesUsersAll);
            return state is FavoritesUsersAll && state.resorts != null
                ? ListView.builder(
                    itemCount: state.resorts!.length,
                    itemBuilder: (context, index) {
                      final resort = state.resorts![index];
                      return ResortCard(resort: resort);
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}
