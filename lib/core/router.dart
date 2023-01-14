import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/ui/main/main_page_host_screen.dart';

import '../ui/export_ui.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: [
  // AutoRoute(path: '/', page: SplashPage),
  // AutoRoute(
  //   path: '/main',
  //   name: 'MainRouter',
  //   page: MainHomePage,
  //   children: [
  //     AutoRoute(
  //       path: 'home_tab',
  //       page: HomeTab,
  //     ),
  //     AutoRoute(
  //       path: 'document_tab',
  //       page: DocumentTab,
  //     ),
  //   ],
  // ),
  AutoRoute(path: '/', page: SplashScreen),
  AutoRoute(path: '/auth', page: AuthScreen),
  AutoRoute(
    path: '/main',
    name: 'MainRouter',
    page:MainPageHostScreen,
    children: [
      AutoRoute(
        path: 'home',
        page: HomeScreen
      ),
      AutoRoute(
        path: 'search',
        page: SearchScreen
      ),
    ]
  ),
  AutoRoute(path: '/details', page: DetailsScreen),

])
class $AppRouter {}