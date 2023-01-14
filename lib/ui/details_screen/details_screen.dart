import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_booking_app/core/router.gr.dart';
import 'package:movie_booking_app/models/responses/movie.dart';
import 'package:movie_booking_app/ui/widgets/gradiant_button.dart';

class DetailsScreen extends ConsumerWidget {
  final Movie movie;
  const DetailsScreen({super.key, required this.movie});
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: CustomSliverAppBarDelegate(expandedHeight: 200),
              pinned: true,
            ),
            // SliverList(delegate: )
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  if (index == 0)
                    return Row(
                      children: [
                        SizedBox(
                          width: 185,
                          height: 190,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Text("Currently Showing Showing",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24)),
                               const SizedBox(
                                height: 15,
                              ),
                              for (int i = 0; i < 4; i++)
                                Table(
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: IntrinsicColumnWidth(),
                                    1: FlexColumnWidth(),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 12),
                                          child: Container(
                                            child: Text(
                                              "Director",
                                              style: TextStyle(
                                                  color: Colors.white24),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text("Shashank Daima",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.white60)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        )
                      ],
                    );
                  if (index == 1) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < 3; i++)
                              Card(
                                  color: Color(0xFF1C1A29),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      color: Colors.white12,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "4.5/5",
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 25),
                                    ),
                                  )),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text("Summary",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w500, fontSize: 20)),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                              style: TextStyle(color: Colors.white54),
                              "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion."),
                        ),
                        GradiantButton(
                          
                            width: MediaQuery.of(context).size.width - 32,
                            borderRadius: BorderRadius.circular(12),
                            onPressed: () {
                              AutoRouter.of(context).push(SeatSelectionRoute());
                            },
                            child: Text(
                              "Book Table",
                              style: GoogleFonts.openSans(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            )),
                        SizedBox(height: 15,)
                      ],
                    );
                  }
                },
                childCount: 2,
              ),
            )
          ],
        ),
      );
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const CustomSliverAppBarDelegate({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = 60;
    final top = expandedHeight - shrinkOffset - size / 2;

    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
        Positioned(
          top: top,
          left: 20,
          right: 20,
          child: buildFloating(shrinkOffset),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF2F2C44),
        ),
      );

  Widget buildBackground(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500/7RyHsO4yDXtBv1zUU3mTpHeQ0d5.jpg',
          fit: BoxFit.cover,
        ),
      );

  Widget buildFloating(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/images/sample_poster.webp",
                width: 150,
                height: 210,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(child: Container())
          ],
        ),
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
