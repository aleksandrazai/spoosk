import 'package:auto_route/auto_route.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          children: [
            AutoRoute(page: Home.page, path: 'Home'),
            AutoRoute(page: Selection.page, path: 'Selection'),
            AutoRoute(page: Comparison.page, path: 'Comparison'),
            AutoRoute(page: Profile.page, path: 'Profile'),
            AutoRoute(page: Selected.page, path: 'Selected'),
            AutoRoute(page: Resort.page),
          ],
        ),
      ];
}
