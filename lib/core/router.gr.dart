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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../models/responses/movie.dart' as _i6;
import '../models/responses/reservation.dart' as _i7;
import '../ui/export_ui.dart' as _i1;
import '../ui/main/history/history_screen.dart' as _i3;
import '../ui/main/main_page_host_screen.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreen(),
      );
    },
    MainRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainPageHostScreen(),
      );
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.DetailsScreen(
          key: args.key,
          movie: args.movie,
        ),
      );
    },
    SeatSelectionRoute.name: (routeData) {
      final args = routeData.argsAs<SeatSelectionRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SeatSelectionScreen(
          movie: args.movie,
          key: args.key,
        ),
      );
    },
    FinalTicketRoute.name: (routeData) {
      final args = routeData.argsAs<FinalTicketRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.FinalTicketScreen(
          reservations: args.reservations,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SearchScreen(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HistoryScreen(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          AuthRoute.name,
          path: '/auth',
        ),
        _i4.RouteConfig(
          MainRouter.name,
          path: '/main',
          children: [
            _i4.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: MainRouter.name,
            ),
            _i4.RouteConfig(
              SearchRoute.name,
              path: 'search',
              parent: MainRouter.name,
            ),
            _i4.RouteConfig(
              HistoryRoute.name,
              path: 'history',
              parent: MainRouter.name,
            ),
          ],
        ),
        _i4.RouteConfig(
          DetailsRoute.name,
          path: '/details',
        ),
        _i4.RouteConfig(
          SeatSelectionRoute.name,
          path: '/seat-selection',
        ),
        _i4.RouteConfig(
          FinalTicketRoute.name,
          path: '/final-ticket-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i4.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i2.MainPageHostScreen]
class MainRouter extends _i4.PageRouteInfo<void> {
  const MainRouter({List<_i4.PageRouteInfo>? children})
      : super(
          MainRouter.name,
          path: '/main',
          initialChildren: children,
        );

  static const String name = 'MainRouter';
}

/// generated route for
/// [_i1.DetailsScreen]
class DetailsRoute extends _i4.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i5.Key? key,
    required _i6.Movie movie,
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

  final _i5.Key? key;

  final _i6.Movie movie;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [_i1.SeatSelectionScreen]
class SeatSelectionRoute extends _i4.PageRouteInfo<SeatSelectionRouteArgs> {
  SeatSelectionRoute({
    required _i6.Movie movie,
    _i5.Key? key,
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

  final _i6.Movie movie;

  final _i5.Key? key;

  @override
  String toString() {
    return 'SeatSelectionRouteArgs{movie: $movie, key: $key}';
  }
}

/// generated route for
/// [_i1.FinalTicketScreen]
class FinalTicketRoute extends _i4.PageRouteInfo<FinalTicketRouteArgs> {
  FinalTicketRoute({
    required List<_i7.Reservation> reservations,
    _i5.Key? key,
  }) : super(
          FinalTicketRoute.name,
          path: '/final-ticket-screen',
          args: FinalTicketRouteArgs(
            reservations: reservations,
            key: key,
          ),
        );

  static const String name = 'FinalTicketRoute';
}

class FinalTicketRouteArgs {
  const FinalTicketRouteArgs({
    required this.reservations,
    this.key,
  });

  final List<_i7.Reservation> reservations;

  final _i5.Key? key;

  @override
  String toString() {
    return 'FinalTicketRouteArgs{reservations: $reservations, key: $key}';
  }
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.SearchScreen]
class SearchRoute extends _i4.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: 'search',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i3.HistoryScreen]
class HistoryRoute extends _i4.PageRouteInfo<void> {
  const HistoryRoute()
      : super(
          HistoryRoute.name,
          path: 'history',
        );

  static const String name = 'HistoryRoute';
}
