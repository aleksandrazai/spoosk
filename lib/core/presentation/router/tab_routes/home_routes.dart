import 'package:auto_route/auto_route.dart';
import 'package:spoosk/core/presentation/router/routes.gr.dart';

abstract class HomeRoutes {
  static final routes = AutoRoute(
    page: HomeWrapperRoute.page,
    children: [
      AutoRoute(page: HomeRoute.page, initial: true),
      AutoRoute(page: SearchRoute.page),
      AutoRoute(page: ResortRoute.page),
      AutoRoute(page: AllReviewsById.page),
    ],
  );
}
