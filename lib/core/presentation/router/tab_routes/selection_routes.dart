import 'package:auto_route/auto_route.dart';
import 'package:spoosk/core/presentation/router/routes.gr.dart';

abstract class SelectionRoutes {
  static final routes = AutoRoute(
    page: SelectionWrapperRoute.page,
    children: [
      AutoRoute(page: Selection.page, initial: true),
      AutoRoute(page: ResultRoute.page),
      AutoRoute(page: ResortRoute.page),
      AutoRoute(page: AllReviewsById.page),
    ],
  );
}
