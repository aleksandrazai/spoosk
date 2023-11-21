// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:spoosk/core/data/models/resorts.dart' as _i12;
import 'package:spoosk/core/presentation/routes.dart' as _i6;
import 'package:spoosk/core/presentation/screens/comparison.dart' as _i1;
import 'package:spoosk/core/presentation/screens/home.dart' as _i2;
import 'package:spoosk/core/presentation/screens/main_screen.dart' as _i3;
import 'package:spoosk/core/presentation/screens/profile.dart' as _i4;
import 'package:spoosk/core/presentation/screens/resort_screen.dart' as _i5;
import 'package:spoosk/core/presentation/screens/selected.dart' as _i8;
import 'package:spoosk/core/presentation/screens/selection.dart' as _i9;
import 'package:spoosk/core/presentation/screens/selection_screen/result.dart'
    as _i7;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    Comparison.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.Comparison(),
      );
    },
    Home.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Home(),
      );
    },
    MainRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainScreen(),
      );
    },
    Profile.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Profile(),
      );
    },
    ResortRoute.name: (routeData) {
      final args = routeData.argsAs<ResortRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ResortScreen(
          key: args.key,
          resort: args.resort,
        ),
      );
    },
    ResortTab.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ResortTabPage(),
      );
    },
    ResultRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ResultScreen(),
      );
    },
    Selected.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.Selected(),
      );
    },
    Selection.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Selection(),
      );
    },
  };
}

/// generated route for
/// [_i1.Comparison]
class Comparison extends _i10.PageRouteInfo<void> {
  const Comparison({List<_i10.PageRouteInfo>? children})
      : super(
          Comparison.name,
          initialChildren: children,
        );

  static const String name = 'Comparison';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Home]
class Home extends _i10.PageRouteInfo<void> {
  const Home({List<_i10.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MainScreen]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.Profile]
class Profile extends _i10.PageRouteInfo<void> {
  const Profile({List<_i10.PageRouteInfo>? children})
      : super(
          Profile.name,
          initialChildren: children,
        );

  static const String name = 'Profile';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ResortScreen]
class ResortRoute extends _i10.PageRouteInfo<ResortRouteArgs> {
  ResortRoute({
    _i11.Key? key,
    required _i12.Resorts? resort,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ResortRoute.name,
          args: ResortRouteArgs(
            key: key,
            resort: resort,
          ),
          initialChildren: children,
        );

  static const String name = 'ResortRoute';

  static const _i10.PageInfo<ResortRouteArgs> page =
      _i10.PageInfo<ResortRouteArgs>(name);
}

class ResortRouteArgs {
  const ResortRouteArgs({
    this.key,
    required this.resort,
  });

  final _i11.Key? key;

  final _i12.Resorts? resort;

  @override
  String toString() {
    return 'ResortRouteArgs{key: $key, resort: $resort}';
  }
}

/// generated route for
/// [_i6.ResortTabPage]
class ResortTab extends _i10.PageRouteInfo<void> {
  const ResortTab({List<_i10.PageRouteInfo>? children})
      : super(
          ResortTab.name,
          initialChildren: children,
        );

  static const String name = 'ResortTab';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ResultScreen]
class ResultRoute extends _i10.PageRouteInfo<void> {
  const ResultRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.Selected]
class Selected extends _i10.PageRouteInfo<void> {
  const Selected({List<_i10.PageRouteInfo>? children})
      : super(
          Selected.name,
          initialChildren: children,
        );

  static const String name = 'Selected';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Selection]
class Selection extends _i10.PageRouteInfo<void> {
  const Selection({List<_i10.PageRouteInfo>? children})
      : super(
          Selection.name,
          initialChildren: children,
        );

  static const String name = 'Selection';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
