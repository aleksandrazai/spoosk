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
            //Home Page
            AutoRoute(
              path: 'emptyhome',
              page: ResortTab.page,
              children: [
                RedirectRoute(path: '', redirectTo: 'emptyhome/:id'),
                AutoRoute(page: Home.page, path: 'Home'),
                //Resort Page
                AutoRoute(
                    page: ResortEmptyRoute.page,
                    path: 'emptyresort',
                    children: [
                      RedirectRoute(path: '', redirectTo: 'emptyresort'),
                      AutoRoute(
                        page: ResortRoute.page,
                        path: 'resortscreen',
                      ),
                      AutoRoute(page: AllReviewsById.page, path: 'allreviews'),
                    ]),
                AutoRoute(
                  page: ResortRoute.page,
                  path: 'resortscreen',
                ),
                //Search Page
                AutoRoute(page: SearchRoute.page, path: 'search'),
              ],
            ),
            //Selection Page
            AutoRoute(
                page: SelectionTab.page,
                path: 'emptyselection',
                children: [
                  RedirectRoute(path: '', redirectTo: 'emptyselection'),
                  AutoRoute(page: Selection.page, path: 'Selection'),
                  AutoRoute(page: ResultRoute.page, path: 'ResultSelection'),
                  AutoRoute(page: ResortRoute.page, path: 'resortscreen'),
                ]),
            //Login Page
            AutoRoute(
              page: LoginEmptyRoute.page,
              path: 'emptylogin',
              children: [
                RedirectRoute(path: '', redirectTo: 'login'),
                AutoRoute(
                    page: ProfileEmptyRoute.page,
                    path: 'emptyprofile',
                    children: [
                      RedirectRoute(path: '', redirectTo: 'emptyprofile'),
                      AutoRoute(page: UserEditProfile.page, path: 'edit'),
                      AutoRoute(page: UserReviews.page, path: 'reviews'),
                      AutoRoute(
                          page: UserProfileRoute.page, path: 'userprofile'),
                      AutoRoute(page: LoginRoute.page, path: 'login'),
                    ]),
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
            //Comparison
            AutoRoute(page: Comparison.page, path: 'Comparison'),
            //Favourites
            AutoRoute(
                page: FavouriteEmptyRoute.page,
                path: 'emptyfavourite',
                children: [
                  RedirectRoute(path: '', redirectTo: 'emptyfavourite'),
                  AutoRoute(page: Favorites.page),
                  AutoRoute(page: ResortRoute.page, path: 'resortscreen'),
                ]),
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

@RoutePage()
class ProfileEmptyPage extends AutoRouter {
  const ProfileEmptyPage({super.key});
}

@RoutePage()
class ResortEmptyPage extends AutoRouter {
  const ResortEmptyPage({super.key});
}

@RoutePage()
class FavouriteEmptyPage extends AutoRouter {
  const FavouriteEmptyPage({super.key});
}
