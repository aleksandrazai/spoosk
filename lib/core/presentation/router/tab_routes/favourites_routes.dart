import 'package:auto_route/auto_route.dart';
import 'package:spoosk/core/presentation/router/routes.gr.dart';

abstract class FavouritesRoutes {
  static final routes = AutoRoute(
    page: FavouritesWrapperRoute.page,
    children: [
      AutoRoute(page: Favorites.page, initial: true),
      AutoRoute(page: ResortRoute.page),
      AutoRoute(page: AllReviewsById.page),
      AutoRoute(page: LoginRoute.page),
      AutoRoute(page: RegisterRoute.page),
      AutoRoute(page: ResetPasswordRoute.page),
      AutoRoute(page: EnterCodeRoute.page),
      AutoRoute(page: ChangePasswordRoute.page),
    ],
  );
}
