import 'package:auto_route/auto_route.dart';
import 'routes.gr.dart';

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
                AutoRoute(page: Home.page, path: 'Home'),
                AutoRoute(page: ResortRoute.page, path: 'resortscreen'),
                AutoRoute(page: SearchRoute.page, path: 'search'),
                AutoRoute(page: AllReviewsById.page, path: 'allreviews'),
              ],
            ),
            AutoRoute(
                page: SelectionTab.page,
                path: 'emptyselection',
                children: [
                  RedirectRoute(path: '', redirectTo: 'emptyselection'),
                  AutoRoute(page: Selection.page, path: 'Selection'),
                  AutoRoute(page: ResultRoute.page, path: 'ResultSelection'),
                  AutoRoute(page: ResortRoute.page, path: 'resortscreen'),
                ]),
            AutoRoute(
              page: LoginEmptyRoute.page,
              path: 'emptylogin',
              children: [
                RedirectRoute(path: '', redirectTo: 'emptylogin'),
                AutoRoute(page: UserProfileRoute.page, path: 'userprofile'),
                AutoRoute(page: Profile.page, path: 'profile'),
                AutoRoute(page: LoginRoute.page, path: 'login'),
                AutoRoute(page: RegisterRoute.page, path: 'register'),
                AutoRoute(page: EnterCodeRoute.page, path: 'code'),
                AutoRoute(
                  page: ResetPasswordRoute.page,
                  path: 'reset',
                ),
                AutoRoute(page: EnterCodeRoute.page, path: 'code'),
                AutoRoute(
                    page: ChangePasswordRoute.page, path: 'changepassword'),
              ],
            ),
            AutoRoute(page: Comparison.page, path: 'Comparison'),
            AutoRoute(page: Selected.page, path: 'Selected'),
          ],
        ),
      ];
}

@RoutePage(name: 'ResortTab')
class ResortTabPage extends AutoRouter {
  const ResortTabPage({super.key});
}

@RoutePage(name: 'SelectionTab')
class SelectionEmptyPage extends AutoRouter {
  const SelectionEmptyPage({super.key});
}

@RoutePage()
class LoginEmptyPage extends AutoRouter {
  const LoginEmptyPage({super.key});
}
