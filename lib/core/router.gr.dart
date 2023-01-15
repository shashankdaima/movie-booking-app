// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../models/responses/movie.dart' as _i5;
import '../ui/export_ui.dart' as _i1;
import '../ui/main/main_page_host_screen.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreen(),
      );
    },
    MainRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainPageHostScreen(),
      );
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.DetailsScreen(
          key: args.key,
          movie: args.movie,
        ),
      );
    },
    SeatSelectionRoute.name: (routeData) {
      final args = routeData.argsAs<SeatSelectionRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SeatSelectionScreen(
          movie: args.movie,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SearchScreen(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          AuthRoute.name,
          path: '/auth',
        ),
        _i3.RouteConfig(
          MainRouter.name,
          path: '/main',
          children: [
            _i3.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: MainRouter.name,
            ),
            _i3.RouteConfig(
              SearchRoute.name,
              path: 'search',
              parent: MainRouter.name,
            ),
          ],
        ),
        _i3.RouteConfig(
          DetailsRoute.name,
          path: '/details',
        ),
        _i3.RouteConfig(
          SeatSelectionRoute.name,
          path: '/seat-selection',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i3.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i3.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i2.MainPageHostScreen]
class MainRouter extends _i3.PageRouteInfo<void> {
  const MainRouter({List<_i3.PageRouteInfo>? children})
      : super(
          MainRouter.name,
          path: '/main',
          initialChildren: children,
        );

  static const String name = 'MainRouter';
}

/// generated route for
/// [_i1.DetailsScreen]
class DetailsRoute extends _i3.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i4.Key? key,
    required _i5.Movie movie,
  }) : super(
          DetailsRoute.name,
          path: '/details',
          args: DetailsRouteArgs(
            key: key,
            movie: movie,
          ),
        );

  static const String name = 'DetailsRoute';
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    required this.movie,
  });

  final _i4.Key? key;

  final _i5.Movie movie;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [_i1.SeatSelectionScreen]
class SeatSelectionRoute extends _i3.PageRouteInfo<SeatSelectionRouteArgs> {
  SeatSelectionRoute({
    required _i5.Movie movie,
    _i4.Key? key,
  }) : super(
          SeatSelectionRoute.name,
          path: '/seat-selection',
          args: SeatSelectionRouteArgs(
            movie: movie,
            key: key,
          ),
        );

  static const String name = 'SeatSelectionRoute';
}

class SeatSelectionRouteArgs {
  const SeatSelectionRouteArgs({
    required this.movie,
    this.key,
  });

  final _i5.Movie movie;

  final _i4.Key? key;

  @override
  String toString() {
    return 'SeatSelectionRouteArgs{movie: $movie, key: $key}';
  }
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.SearchScreen]
class SearchRoute extends _i3.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: 'search',
        );

  static const String name = 'SearchRoute';
}
