import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_booking_app/ui/export_ui.dart';

import '../../core/router.gr.dart';

class MainPageHostScreen extends StatelessWidget {
  const MainPageHostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        appBarBuilder: ((context, tabsRouter) => AppBar(
              title: Text("204, Sector-30, Faridabad"),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            )),
        routes: const [HomeRoute(), SearchRoute()],
        bottomNavigationBuilder: (context, tabsRouter) => BottomNavigationBar(
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white30,
              backgroundColor: Color(0xFF2F2C44),
              currentIndex: tabsRouter.activeIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.description), label: "Documents"),
              ],
            ));
  }
}
