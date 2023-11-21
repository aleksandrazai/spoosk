import 'package:auto_route/auto_route.dart';
import 'package:spoosk/core/presentation/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          path: '/',
          initial: true,
          children: [
            AutoRoute(
              path: 'emptyhome',
              page: ResortTab.page,
              children: [
                RedirectRoute(path: '', redirectTo: 'emptyhome/:id'),
                AutoRoute(
                  page: Home.page,
                  path: 'Home',
                ),
                AutoRoute(page: ResortRoute.page, path: 'resortscreen'),
                AutoRoute(page: ResultRoute.page, path: 'Result'),
              ],
            ),
            AutoRoute(page: Selection.page, path: 'Selection'),
            AutoRoute(page: Comparison.page, path: 'Comparison'),
            AutoRoute(page: Selected.page, path: 'Selected'),
            AutoRoute(page: Profile.page, path: 'Profile'),
          ],
        ),
      ];
}

@RoutePage(name: 'ResortTab')
class ResortTabPage extends AutoRouter {
  const ResortTabPage({super.key});
}
