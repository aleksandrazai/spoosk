// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:spoosk/core/data/models/reviews.dart' as _i14;
import 'package:spoosk/core/presentation/routes.dart' as _i7;
import 'package:spoosk/core/presentation/screens/all_reviews_by_id.dart' as _i1;
import 'package:spoosk/core/presentation/screens/comparison.dart' as _i2;
import 'package:spoosk/core/presentation/screens/home.dart' as _i3;
import 'package:spoosk/core/presentation/screens/main_screen.dart' as _i4;
import 'package:spoosk/core/presentation/screens/profile.dart' as _i5;
import 'package:spoosk/core/presentation/screens/resort_screen.dart' as _i6;
import 'package:spoosk/core/presentation/screens/search_screen.dart' as _i9;
import 'package:spoosk/core/presentation/screens/selected.dart' as _i10;
import 'package:spoosk/core/presentation/screens/selection.dart' as _i11;
import 'package:spoosk/core/presentation/screens/selection_screen/result.dart'
    as _i8;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AllReviewsById.name: (routeData) {
      final args = routeData.argsAs<AllReviewsByIdArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AllReviewsById(
          key: args.key,
          reviews: args.reviews,
        ),
      );
    },
    Comparison.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Comparison(),
      );
    },
    Home.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Home(),
      );
    },
    MainRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainScreen(),
      );
    },
    Profile.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Profile(),
      );
    },
    ResortRoute.name: (routeData) {
      final args = routeData.argsAs<ResortRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ResortScreen(
          key: args.key,
          idResort: args.idResort,
        ),
      );
    },
    ResortTab.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ResortTabPage(),
      );
    },
    ResultRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ResultScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SearchScreen(),
      );
    },
    Selected.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.Selected(),
      );
    },
    Selection.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.Selection(),
      );
    },
    SelectionTab.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SelectionEmptyPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AllReviewsById]
class AllReviewsById extends _i12.PageRouteInfo<AllReviewsByIdArgs> {
  AllReviewsById({
    _i13.Key? key,
    required _i14.Reviews reviews,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          AllReviewsById.name,
          args: AllReviewsByIdArgs(
            key: key,
            reviews: reviews,
          ),
          initialChildren: children,
        );

  static const String name = 'AllReviewsById';

  static const _i12.PageInfo<AllReviewsByIdArgs> page =
      _i12.PageInfo<AllReviewsByIdArgs>(name);
}

class AllReviewsByIdArgs {
  const AllReviewsByIdArgs({
    this.key,
    required this.reviews,
  });

  final _i13.Key? key;

  final _i14.Reviews reviews;

  @override
  String toString() {
    return 'AllReviewsByIdArgs{key: $key, reviews: $reviews}';
  }
}

/// generated route for
/// [_i2.Comparison]
class Comparison extends _i12.PageRouteInfo<void> {
  const Comparison({List<_i12.PageRouteInfo>? children})
      : super(
          Comparison.name,
          initialChildren: children,
        );

  static const String name = 'Comparison';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Home]
class Home extends _i12.PageRouteInfo<void> {
  const Home({List<_i12.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainScreen]
class MainRoute extends _i12.PageRouteInfo<void> {
  const MainRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.Profile]
class Profile extends _i12.PageRouteInfo<void> {
  const Profile({List<_i12.PageRouteInfo>? children})
      : super(
          Profile.name,
          initialChildren: children,
        );

  static const String name = 'Profile';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ResortScreen]
class ResortRoute extends _i12.PageRouteInfo<ResortRouteArgs> {
  ResortRoute({
    _i13.Key? key,
    required String idResort,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ResortRoute.name,
          args: ResortRouteArgs(
            key: key,
            idResort: idResort,
          ),
          initialChildren: children,
        );

  static const String name = 'ResortRoute';

  static const _i12.PageInfo<ResortRouteArgs> page =
      _i12.PageInfo<ResortRouteArgs>(name);
}

class ResortRouteArgs {
  const ResortRouteArgs({
    this.key,
    required this.idResort,
  });

  final _i13.Key? key;

  final String idResort;

  @override
  String toString() {
    return 'ResortRouteArgs{key: $key, idResort: $idResort}';
  }
}

/// generated route for
/// [_i7.ResortTabPage]
class ResortTab extends _i12.PageRouteInfo<void> {
  const ResortTab({List<_i12.PageRouteInfo>? children})
      : super(
          ResortTab.name,
          initialChildren: children,
        );

  static const String name = 'ResortTab';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ResultScreen]
class ResultRoute extends _i12.PageRouteInfo<void> {
  const ResultRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SearchScreen]
class SearchRoute extends _i12.PageRouteInfo<void> {
  const SearchRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.Selected]
class Selected extends _i12.PageRouteInfo<void> {
  const Selected({List<_i12.PageRouteInfo>? children})
      : super(
          Selected.name,
          initialChildren: children,
        );

  static const String name = 'Selected';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Selection]
class Selection extends _i12.PageRouteInfo<void> {
  const Selection({List<_i12.PageRouteInfo>? children})
      : super(
          Selection.name,
          initialChildren: children,
        );

  static const String name = 'Selection';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SelectionEmptyPage]
class SelectionTab extends _i12.PageRouteInfo<void> {
  const SelectionTab({List<_i12.PageRouteInfo>? children})
      : super(
          SelectionTab.name,
          initialChildren: children,
        );

  static const String name = 'SelectionTab';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
