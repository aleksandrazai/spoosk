// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;
import 'package:spoosk/core/data/models/reviews.dart' as _i20;
import 'package:spoosk/core/presentation/routes.dart' as _i6;
import 'package:spoosk/core/presentation/screens/all_reviews_by_id.dart' as _i1;
import 'package:spoosk/core/presentation/screens/auth/change_password.dart'
    as _i2;
import 'package:spoosk/core/presentation/screens/auth/code.dart' as _i4;
import 'package:spoosk/core/presentation/screens/auth/login.dart' as _i7;
import 'package:spoosk/core/presentation/screens/auth/register.dart' as _i10;
import 'package:spoosk/core/presentation/screens/auth/reset_password.dart'
    as _i11;
import 'package:spoosk/core/presentation/screens/auth/user_profile.dart'
    as _i17;
import 'package:spoosk/core/presentation/screens/comparison.dart' as _i3;
import 'package:spoosk/core/presentation/screens/home.dart' as _i5;
import 'package:spoosk/core/presentation/screens/main_screen.dart' as _i8;
import 'package:spoosk/core/presentation/screens/profile.dart' as _i9;
import 'package:spoosk/core/presentation/screens/resort_screen.dart' as _i12;
import 'package:spoosk/core/presentation/screens/search_screen.dart' as _i14;
import 'package:spoosk/core/presentation/screens/selected.dart' as _i15;
import 'package:spoosk/core/presentation/screens/selection.dart' as _i16;
import 'package:spoosk/core/presentation/screens/selection_screen/result.dart'
    as _i13;

abstract class $AppRouter extends _i18.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    AllReviewsById.name: (routeData) {
      final args = routeData.argsAs<AllReviewsByIdArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AllReviewsById(
          key: args.key,
          reviews: args.reviews,
        ),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ChangePasswordScreen(),
      );
    },
    Comparison.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Comparison(),
      );
    },
    EnterCodeRoute.name: (routeData) {
      final args = routeData.argsAs<EnterCodeRouteArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.EnterCodeScreen(
          key: args.key,
          sourcePage: args.sourcePage,
        ),
      );
    },
    Home.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Home(),
      );
    },
    LoginEmptyRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LoginEmptyPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MainScreen(),
      );
    },
    Profile.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Profile(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.RegisterScreen(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ResetPasswordScreen(),
      );
    },
    ResortRoute.name: (routeData) {
      final args = routeData.argsAs<ResortRouteArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.ResortScreen(
          key: args.key,
          idResort: args.idResort,
        ),
      );
    },
    ResortTab.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ResortTabPage(),
      );
    },
    ResultRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ResultScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SearchScreen(),
      );
    },
    Selected.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.Selected(),
      );
    },
    Selection.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.Selection(),
      );
    },
    SelectionTab.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SelectionEmptyPage(),
      );
    },
    UserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileRouteArgs>(
          orElse: () => const UserProfileRouteArgs());
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.UserProfileScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AllReviewsById]
class AllReviewsById extends _i18.PageRouteInfo<AllReviewsByIdArgs> {
  AllReviewsById({
    _i19.Key? key,
    required _i20.Reviews reviews,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          AllReviewsById.name,
          args: AllReviewsByIdArgs(
            key: key,
            reviews: reviews,
          ),
          initialChildren: children,
        );

  static const String name = 'AllReviewsById';

  static const _i18.PageInfo<AllReviewsByIdArgs> page =
      _i18.PageInfo<AllReviewsByIdArgs>(name);
}

class AllReviewsByIdArgs {
  const AllReviewsByIdArgs({
    this.key,
    required this.reviews,
  });

  final _i19.Key? key;

  final _i20.Reviews reviews;

  @override
  String toString() {
    return 'AllReviewsByIdArgs{key: $key, reviews: $reviews}';
  }
}

/// generated route for
/// [_i2.ChangePasswordScreen]
class ChangePasswordRoute extends _i18.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Comparison]
class Comparison extends _i18.PageRouteInfo<void> {
  const Comparison({List<_i18.PageRouteInfo>? children})
      : super(
          Comparison.name,
          initialChildren: children,
        );

  static const String name = 'Comparison';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EnterCodeScreen]
class EnterCodeRoute extends _i18.PageRouteInfo<EnterCodeRouteArgs> {
  EnterCodeRoute({
    _i19.Key? key,
    required String sourcePage,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          EnterCodeRoute.name,
          args: EnterCodeRouteArgs(
            key: key,
            sourcePage: sourcePage,
          ),
          initialChildren: children,
        );

  static const String name = 'EnterCodeRoute';

  static const _i18.PageInfo<EnterCodeRouteArgs> page =
      _i18.PageInfo<EnterCodeRouteArgs>(name);
}

class EnterCodeRouteArgs {
  const EnterCodeRouteArgs({
    this.key,
    required this.sourcePage,
  });

  final _i19.Key? key;

  final String sourcePage;

  @override
  String toString() {
    return 'EnterCodeRouteArgs{key: $key, sourcePage: $sourcePage}';
  }
}

/// generated route for
/// [_i5.Home]
class Home extends _i18.PageRouteInfo<void> {
  const Home({List<_i18.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginEmptyPage]
class LoginEmptyRoute extends _i18.PageRouteInfo<void> {
  const LoginEmptyRoute({List<_i18.PageRouteInfo>? children})
      : super(
          LoginEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginEmptyRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginScreen]
class LoginRoute extends _i18.PageRouteInfo<void> {
  const LoginRoute({List<_i18.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MainScreen]
class MainRoute extends _i18.PageRouteInfo<void> {
  const MainRoute({List<_i18.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Profile]
class Profile extends _i18.PageRouteInfo<void> {
  const Profile({List<_i18.PageRouteInfo>? children})
      : super(
          Profile.name,
          initialChildren: children,
        );

  static const String name = 'Profile';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i10.RegisterScreen]
class RegisterRoute extends _i18.PageRouteInfo<void> {
  const RegisterRoute({List<_i18.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ResetPasswordScreen]
class ResetPasswordRoute extends _i18.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ResortScreen]
class ResortRoute extends _i18.PageRouteInfo<ResortRouteArgs> {
  ResortRoute({
    _i19.Key? key,
    required String idResort,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          ResortRoute.name,
          args: ResortRouteArgs(
            key: key,
            idResort: idResort,
          ),
          initialChildren: children,
        );

  static const String name = 'ResortRoute';

  static const _i18.PageInfo<ResortRouteArgs> page =
      _i18.PageInfo<ResortRouteArgs>(name);
}

class ResortRouteArgs {
  const ResortRouteArgs({
    this.key,
    required this.idResort,
  });

  final _i19.Key? key;

  final String idResort;

  @override
  String toString() {
    return 'ResortRouteArgs{key: $key, idResort: $idResort}';
  }
}

/// generated route for
/// [_i6.ResortTabPage]
class ResortTab extends _i18.PageRouteInfo<void> {
  const ResortTab({List<_i18.PageRouteInfo>? children})
      : super(
          ResortTab.name,
          initialChildren: children,
        );

  static const String name = 'ResortTab';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ResultScreen]
class ResultRoute extends _i18.PageRouteInfo<void> {
  const ResultRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SearchScreen]
class SearchRoute extends _i18.PageRouteInfo<void> {
  const SearchRoute({List<_i18.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i15.Selected]
class Selected extends _i18.PageRouteInfo<void> {
  const Selected({List<_i18.PageRouteInfo>? children})
      : super(
          Selected.name,
          initialChildren: children,
        );

  static const String name = 'Selected';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i16.Selection]
class Selection extends _i18.PageRouteInfo<void> {
  const Selection({List<_i18.PageRouteInfo>? children})
      : super(
          Selection.name,
          initialChildren: children,
        );

  static const String name = 'Selection';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SelectionEmptyPage]
class SelectionTab extends _i18.PageRouteInfo<void> {
  const SelectionTab({List<_i18.PageRouteInfo>? children})
      : super(
          SelectionTab.name,
          initialChildren: children,
        );

  static const String name = 'SelectionTab';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i17.UserProfileScreen]
class UserProfileRoute extends _i18.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          UserProfileRoute.name,
          args: UserProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const _i18.PageInfo<UserProfileRouteArgs> page =
      _i18.PageInfo<UserProfileRouteArgs>(name);
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key}';
  }
}
