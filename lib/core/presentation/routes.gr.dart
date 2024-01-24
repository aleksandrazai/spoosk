// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/material.dart' as _i22;
import 'package:spoosk/core/data/models/reviews.dart' as _i23;
import 'package:spoosk/core/presentation/routes.dart' as _i8;
import 'package:spoosk/core/presentation/screens/all_resorts.dart' as _i1;
import 'package:spoosk/core/presentation/screens/all_reviews_by_id.dart' as _i2;
import 'package:spoosk/core/presentation/screens/auth/change_password.dart'
    as _i3;
import 'package:spoosk/core/presentation/screens/auth/code.dart' as _i5;
import 'package:spoosk/core/presentation/screens/auth/login.dart' as _i9;
import 'package:spoosk/core/presentation/screens/auth/register.dart' as _i12;
import 'package:spoosk/core/presentation/screens/auth/reset_password.dart'
    as _i13;
import 'package:spoosk/core/presentation/screens/comparison.dart' as _i4;
import 'package:spoosk/core/presentation/screens/favorites.dart' as _i6;
import 'package:spoosk/core/presentation/screens/home.dart' as _i7;
import 'package:spoosk/core/presentation/screens/main_screen.dart' as _i10;
import 'package:spoosk/core/presentation/screens/profile.dart' as _i11;
import 'package:spoosk/core/presentation/screens/resort_screen.dart' as _i14;
import 'package:spoosk/core/presentation/screens/search_screen.dart' as _i16;
import 'package:spoosk/core/presentation/screens/selection.dart' as _i17;
import 'package:spoosk/core/presentation/screens/selection_screen/result.dart'
    as _i15;
import 'package:spoosk/core/presentation/screens/user_lk/user_edit.dart'
    as _i18;
import 'package:spoosk/core/presentation/screens/user_lk/user_profile.dart'
    as _i19;
import 'package:spoosk/core/presentation/screens/user_lk/user_reviews.dart'
    as _i20;

abstract class $AppRouter extends _i21.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    AllResortsRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AllResortsScreen(),
      );
    },
    AllReviewsById.name: (routeData) {
      final args = routeData.argsAs<AllReviewsByIdArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AllReviewsById(
          key: args.key,
          reviews: args.reviews,
        ),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ChangePasswordScreen(),
      );
    },
    Comparison.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Comparison(),
      );
    },
    EnterCodeRoute.name: (routeData) {
      final args = routeData.argsAs<EnterCodeRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.EnterCodeScreen(
          key: args.key,
          sourcePage: args.sourcePage,
        ),
      );
    },
    Favorites.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.Favorites(),
      );
    },
    Home.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.Home(),
      );
    },
    LoginEmptyRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginEmptyPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoginScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MainScreen(),
      );
    },
    Profile.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.Profile(),
      );
    },
    ProfileEmptyRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileEmptyPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.RegisterScreen(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ResetPasswordScreen(),
      );
    },
    ResortRoute.name: (routeData) {
      final args = routeData.argsAs<ResortRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.ResortScreen(
          key: args.key,
          idResort: args.idResort,
        ),
      );
    },
    ResortTab.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ResortTabPage(),
      );
    },
    ResultRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ResultScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SearchScreen(),
      );
    },
    Selection.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.Selection(),
      );
    },
    SelectionTab.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SelectionEmptyPage(),
      );
    },
    UserEditProfile.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.UserEditProfile(),
      );
    },
    UserProfileRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.UserProfileScreen(),
      );
    },
    UserReviews.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.UserReviews(),
      );
    },
  };
}

/// generated route for
/// [_i1.AllResortsScreen]
class AllResortsRoute extends _i21.PageRouteInfo<void> {
  const AllResortsRoute({List<_i21.PageRouteInfo>? children})
      : super(
          AllResortsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllResortsRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AllReviewsById]
class AllReviewsById extends _i21.PageRouteInfo<AllReviewsByIdArgs> {
  AllReviewsById({
    _i22.Key? key,
    required List<_i23.Review>? reviews,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          AllReviewsById.name,
          args: AllReviewsByIdArgs(
            key: key,
            reviews: reviews,
          ),
          initialChildren: children,
        );

  static const String name = 'AllReviewsById';

  static const _i21.PageInfo<AllReviewsByIdArgs> page =
      _i21.PageInfo<AllReviewsByIdArgs>(name);
}

class AllReviewsByIdArgs {
  const AllReviewsByIdArgs({
    this.key,
    required this.reviews,
  });

  final _i22.Key? key;

  final List<_i23.Review>? reviews;

  @override
  String toString() {
    return 'AllReviewsByIdArgs{key: $key, reviews: $reviews}';
  }
}

/// generated route for
/// [_i3.ChangePasswordScreen]
class ChangePasswordRoute extends _i21.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i4.Comparison]
class Comparison extends _i21.PageRouteInfo<void> {
  const Comparison({List<_i21.PageRouteInfo>? children})
      : super(
          Comparison.name,
          initialChildren: children,
        );

  static const String name = 'Comparison';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i5.EnterCodeScreen]
class EnterCodeRoute extends _i21.PageRouteInfo<EnterCodeRouteArgs> {
  EnterCodeRoute({
    _i22.Key? key,
    required String sourcePage,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          EnterCodeRoute.name,
          args: EnterCodeRouteArgs(
            key: key,
            sourcePage: sourcePage,
          ),
          initialChildren: children,
        );

  static const String name = 'EnterCodeRoute';

  static const _i21.PageInfo<EnterCodeRouteArgs> page =
      _i21.PageInfo<EnterCodeRouteArgs>(name);
}

class EnterCodeRouteArgs {
  const EnterCodeRouteArgs({
    this.key,
    required this.sourcePage,
  });

  final _i22.Key? key;

  final String sourcePage;

  @override
  String toString() {
    return 'EnterCodeRouteArgs{key: $key, sourcePage: $sourcePage}';
  }
}

/// generated route for
/// [_i6.Favorites]
class Favorites extends _i21.PageRouteInfo<void> {
  const Favorites({List<_i21.PageRouteInfo>? children})
      : super(
          Favorites.name,
          initialChildren: children,
        );

  static const String name = 'Favorites';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i7.Home]
class Home extends _i21.PageRouteInfo<void> {
  const Home({List<_i21.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginEmptyPage]
class LoginEmptyRoute extends _i21.PageRouteInfo<void> {
  const LoginEmptyRoute({List<_i21.PageRouteInfo>? children})
      : super(
          LoginEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginEmptyRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginScreen]
class LoginRoute extends _i21.PageRouteInfo<void> {
  const LoginRoute({List<_i21.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MainScreen]
class MainRoute extends _i21.PageRouteInfo<void> {
  const MainRoute({List<_i21.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Profile]
class Profile extends _i21.PageRouteInfo<void> {
  const Profile({List<_i21.PageRouteInfo>? children})
      : super(
          Profile.name,
          initialChildren: children,
        );

  static const String name = 'Profile';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProfileEmptyPage]
class ProfileEmptyRoute extends _i21.PageRouteInfo<void> {
  const ProfileEmptyRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ProfileEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileEmptyRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i12.RegisterScreen]
class RegisterRoute extends _i21.PageRouteInfo<void> {
  const RegisterRoute({List<_i21.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ResetPasswordScreen]
class ResetPasswordRoute extends _i21.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ResortScreen]
class ResortRoute extends _i21.PageRouteInfo<ResortRouteArgs> {
  ResortRoute({
    _i22.Key? key,
    required String idResort,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          ResortRoute.name,
          args: ResortRouteArgs(
            key: key,
            idResort: idResort,
          ),
          initialChildren: children,
        );

  static const String name = 'ResortRoute';

  static const _i21.PageInfo<ResortRouteArgs> page =
      _i21.PageInfo<ResortRouteArgs>(name);
}

class ResortRouteArgs {
  const ResortRouteArgs({
    this.key,
    required this.idResort,
  });

  final _i22.Key? key;

  final String idResort;

  @override
  String toString() {
    return 'ResortRouteArgs{key: $key, idResort: $idResort}';
  }
}

/// generated route for
/// [_i8.ResortTabPage]
class ResortTab extends _i21.PageRouteInfo<void> {
  const ResortTab({List<_i21.PageRouteInfo>? children})
      : super(
          ResortTab.name,
          initialChildren: children,
        );

  static const String name = 'ResortTab';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i15.ResultScreen]
class ResultRoute extends _i21.PageRouteInfo<void> {
  const ResultRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SearchScreen]
class SearchRoute extends _i21.PageRouteInfo<void> {
  const SearchRoute({List<_i21.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i17.Selection]
class Selection extends _i21.PageRouteInfo<void> {
  const Selection({List<_i21.PageRouteInfo>? children})
      : super(
          Selection.name,
          initialChildren: children,
        );

  static const String name = 'Selection';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SelectionEmptyPage]
class SelectionTab extends _i21.PageRouteInfo<void> {
  const SelectionTab({List<_i21.PageRouteInfo>? children})
      : super(
          SelectionTab.name,
          initialChildren: children,
        );

  static const String name = 'SelectionTab';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i18.UserEditProfile]
class UserEditProfile extends _i21.PageRouteInfo<void> {
  const UserEditProfile({List<_i21.PageRouteInfo>? children})
      : super(
          UserEditProfile.name,
          initialChildren: children,
        );

  static const String name = 'UserEditProfile';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i19.UserProfileScreen]
class UserProfileRoute extends _i21.PageRouteInfo<void> {
  const UserProfileRoute({List<_i21.PageRouteInfo>? children})
      : super(
          UserProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i20.UserReviews]
class UserReviews extends _i21.PageRouteInfo<void> {
  const UserReviews({List<_i21.PageRouteInfo>? children})
      : super(
          UserReviews.name,
          initialChildren: children,
        );

  static const String name = 'UserReviews';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}
