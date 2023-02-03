import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/ui/main/history/history_screen.dart';
import 'package:movie_booking_app/ui/main/main_page_host_screen.dart';

import '../ui/export_ui.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: [
  AutoRoute(path: '/', page: SplashScreen),
  AutoRoute(path: '/auth', page: AuthScreen),
  AutoRoute(
      path: '/main',
      name: 'MainRouter',
      page: MainPageHostScreen,
      children: [
        AutoRoute(path: 'home', page: HomeScreen),
        AutoRoute(path: 'search', page: SearchScreen),
        AutoRoute(path: 'history', page: HistoryScreen),
      ]),
  AutoRoute(path: '/details', page: DetailsScreen),
  AutoRoute(path: '/seat-selection', page: SeatSelectionScreen),
  AutoRoute(path: '/final-ticket-screen', page: FinalTicketScreen),
])
class $AppRouter {}
