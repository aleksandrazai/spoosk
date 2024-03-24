import 'package:auto_route/auto_route.dart';
import 'package:spoosk/core/presentation/router/tab_routes/favourites_routes.dart';
import 'package:spoosk/core/presentation/router/tab_routes/home_routes.dart';
import 'package:spoosk/core/presentation/router/routes.gr.dart';
import 'package:spoosk/core/presentation/router/tab_routes/profile_routes.dart';
import 'package:spoosk/core/presentation/router/tab_routes/selection_routes.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          children: [
            HomeRoutes.routes,
            SelectionRoutes.routes,
            FavouritesRoutes.routes,
            ProfileRoutes.routes,
          ],
        ),
      ];
}
