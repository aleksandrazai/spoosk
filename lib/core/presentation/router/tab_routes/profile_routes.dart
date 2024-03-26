import 'package:auto_route/auto_route.dart';
import 'package:spoosk/core/presentation/router/routes.gr.dart';

abstract class ProfileRoutes {
  static final routes = AutoRoute(
    page: ProfileWrapperRoute.page,
    children: [
      AutoRoute(page: ProfileRoute.page, initial: true),
      AutoRoute(page: LoginRoute.page),
      AutoRoute(page: RegisterRoute.page),
      AutoRoute(page: ResetPasswordRoute.page),
      AutoRoute(page: EnterCodeRoute.page),
      AutoRoute(page: ChangePasswordRoute.page),
      AutoRoute(page: UserProfileRoute.page),
      AutoRoute(page: UserEditProfile.page),
      AutoRoute(page: UserReviews.page),
    ],
  );
}
