import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_booking_app/services/supabase/supabase_client.dart';
import 'package:movie_booking_app/ui/export_ui.dart';

import '../../core/router.gr.dart';

class MainPageHostScreen extends StatelessWidget {
  const MainPageHostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        appBarBuilder: ((context, tabsRouter) => AppBar(
              leading: SizedBox(
                height: 34,
                width: 34,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipOval(
                      child: CachedNetworkImage(
                    imageUrl: SupabaseClient.supabaseInstance.auth.currentUser!
                        .userMetadata!["avatar_url"],
                  )),
                ),
              ),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if ((tabsRouter.activeIndex == 0)) ...{
                    const Icon(Icons.location_on_outlined),
                    const Text(
                      "Faridabad, Delhi-NCR",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    )
                  },
                  if ((tabsRouter.activeIndex == 1))
                    const Text(
                      "Search For Your Show",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  if ((tabsRouter.activeIndex == 2))
                    const Text(
                      "Previously Booked Tickets",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    )
                ],
              ),
              actions: [
                if (tabsRouter.activeIndex == 0)
                  const SizedBox(
                      height: 34,
                      width: 34,
                      child: Icon(Icons.notifications_none_outlined))
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            )),
        routes: const [HomeRoute(), SearchRoute(), HistoryRoute()],
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
                    icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.history), label: "History"),
              ],
            ));
  }
}
