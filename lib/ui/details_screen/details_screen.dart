import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_booking_app/core/router.gr.dart';
import 'package:movie_booking_app/models/responses/movie.dart';
import 'package:movie_booking_app/services/api_services/api_service.dart';
import 'package:movie_booking_app/ui/details_screen/details_view_model.dart';
import 'package:movie_booking_app/ui/widgets/gradiant_button.dart';
import 'package:flutter/rendering.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  final Movie movie;
  const DetailsScreen({super.key, required this.movie});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailsState();
}

class _DetailsState extends ConsumerState<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future(
      () => ref
          .read(detailsViewModelProvider.notifier)
          .loadDetailsScreen(widget.movie),
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    final status =
        ref.watch(detailsViewModelProvider.select((value) => value.status));
    final details =
        ref.watch(detailsViewModelProvider.select((value) => value.details));
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CustomSliverAppBarDelegate(
                expandedHeight: 200,
                backgroundImage: ApiService.getImageUrl(details?.backdropPath),
                poster: ApiService.getImageUrl(details?.posterPath)),
            pinned: true,
          ),
          // SliverList(delegate: )
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                if (index == 0) {
                  return Row(
                    children: [
                      const SizedBox(
                        width: 185,
                        height: 190,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 190,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Text(details?.title ?? "".toString(),
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24)),
                              Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: IntrinsicColumnWidth(),
                                },
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: <TableRow>[
                                  // for (int i = 0; i < 4; i++)
                                  TableRow(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12),
                                        child: Container(
                                            child: (details?.status != null)
                                                ? Text(
                                                    "Status",
                                                    style: TextStyle(
                                                        color: Colors.white24),
                                                  )
                                                : Container(
                                                    height: 20,
                                                  )),
                                      ),
                                      Container(
                                        child: (details?.status != null)
                                            ? Text(details?.status ?? "",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.white60))
                                            : Container(
                                                height: 20,
                                              ),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12),
                                        child: Container(
                                            child: (details?.releaseDate !=
                                                    null)
                                                ? Text(
                                                    "Release Date",
                                                    style: TextStyle(
                                                        color: Colors.white24),
                                                  )
                                                : Container(
                                                    height: 20,
                                                  )),
                                      ),
                                      Container(
                                        child: (details?.releaseDate != null)
                                            ? Text(details?.releaseDate ?? "",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.white60))
                                            : Container(
                                                height: 20,
                                              ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }
                if (index == 1) {
                  return (status == DetailsScreenStatus.loading)
                      ? const Center(
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        )
                      : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
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
                                      child: Column(
                                        children: [
                                          RatingBar.builder(
                                            initialRating:
                                                details!.voteAverage! / 2,
                                            itemSize: 12,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            updateOnDrag: false,
                                            onRatingUpdate: (rating) {},
                                          ),
                                          Text(
                                            "${(details!.voteAverage)}/10",
                                            style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    )),
                                // for (int i = 0; i < 2; i++)
                                Card(
                                    color: Color(0xFF1C1A29),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                        color: Colors.white12,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Duration",
                                            style: TextStyle(
                                                color: Colors.white38),
                                          ),
                                          Text(
                                            (details != null)
                                                ? "${details.runtime} Min"
                                                : "N/A",
                                            style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    )),
                                Card(
                                    color: Color(0xFF1C1A29),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        color: Colors.white12,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Age",
                                            style: TextStyle(
                                                color: Colors.white38),
                                          ),
                                          Text(
                                            (details?.adult == null ||
                                                    details?.adult == false)
                                                ? "Universal"
                                                : "Adult",
                                            style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Text("Summary",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w500, fontSize: 20)),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                  style: TextStyle(color: Colors.white54),
                                  details?.overview ?? ""),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                  style: TextStyle(color: Colors.white54),
                                  details?.overview ?? ""),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                  style: TextStyle(color: Colors.white54),
                                  details?.overview ?? ""),
                            ),
                            GradiantButton(
                                width: MediaQuery.of(context).size.width - 32,
                                borderRadius: BorderRadius.circular(12),
                                onPressed: () {
                                  AutoRouter.of(context).push(
                                      SeatSelectionRoute(movie: widget.movie));
                                },
                                child: Text(
                                  "Book Ticket",
                                  style: GoogleFonts.openSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )),
                            SizedBox(
                              height: 15,
                            )
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
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String? backgroundImage;
  final String? poster;
  const CustomSliverAppBarDelegate(
      {required this.expandedHeight,
      required this.backgroundImage,
      required this.poster});

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
        child: (backgroundImage != null)
            ? Image.network(
                backgroundImage!,
                fit: BoxFit.cover,
              )
            : Container(),
      );
// // Image.asset(
//                 "assets/images/sample_poster.webp",
//                 width: 150,
//                 height: 210,
//                 fit: BoxFit.cover,
//               )
  Widget buildFloating(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: (poster != null)
                  ? Image.network(
                      width: 150,
                      height: 210,
                      poster!,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 150,
                      height: 210,
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
