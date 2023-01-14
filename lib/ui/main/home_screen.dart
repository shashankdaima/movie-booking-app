import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_booking_app/core/router.gr.dart';
import 'package:movie_booking_app/models/responses/movie.dart';
import 'package:movie_booking_app/services/api_services/api_service.dart';
import 'package:movie_booking_app/ui/main/home_view_model.dart';
import 'package:movie_booking_app/utils/api_response.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
import 'package:marquee/marquee.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(Object context, WidgetRef ref) {
    // int carouselIndex =
    //     ref.watch(homeViewModelProvider.select((value) => value.carouselIndex));
    // final error =
    //     ref.watch(homeViewModelProvider.select((value) => value.errorMessage));
    // HomeScreenStatus status =
    //     ref.watch(homeViewModelProvider.select((value) => value.status));
    final state = ref.watch(homeViewModelProvider);
    return (state.status == HomeScreenStatus.loading)
        ? const Center(
            child: CircularProgressIndicator.adaptive(),
          )
        : (state.status == HomeScreenStatus.error)
            ? Center(
                child: Text(state.errorMessage!),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 200.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          enlargeFactor: 0.3,
                          onPageChanged: ((index, reason) {
                            ref
                                .read(homeViewModelProvider.notifier)
                                .changeCarouselIndex(index);
                          })),
                      items: state.thumbnailList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(i.thumbnail_url),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(15)),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Center(
                          child: AnimatedSmoothIndicator(
                        activeIndex: state.carouselIndex,
                        count: state.thumbnailList.length,
                        effect: const ExpandingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 14,
                            activeDotColor: Color(0xFF4D438A),
                            dotColor: Color(0xFF2A2740)),
                      )),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                      child: Text("Currently Showing",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          for (int i = 0; i < state.movies.length; i++)
                            MovieOverview(state.movies[i]),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                      child: Text("Coupons and Vouchers",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          for (int i = 0; i < 10; i++) CouponAvailable(),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}

class MovieOverview extends StatelessWidget {
  const MovieOverview(this.movie, {super.key});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500" +
                        movie.posterPath.toString(),
                    height: 210,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    movie.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text("4.5/5")
              ],
            ),
          ),
        ),
        Positioned.fill(
            child: Material(
                borderRadius: BorderRadius.circular(8),
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                child: new InkWell(
                  highlightColor: Color.fromARGB(105, 0, 0, 0),
                  onTap: () => {
                    AutoRouter.of(context).push(DetailsRoute(movie:movie))
                  },
                ))),
      ],
    );
  }
}

class CouponAvailable extends StatelessWidget {
  const CouponAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF867AD2), Color(0xFF494080)])),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  SizedBox(
                    child: Image.asset("assets/images/coupon_image.png"),
                  ),
                  Column(
                    children: [
                      Text(
                        "FLAT 50% OFF",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 17),
                      ),
                      Text(
                        "Use coupon code:\n NEWYEAR2023",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
          ),
          Positioned.fill(
              child: Material(
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.transparent,
                  child: new InkWell(
                    onTap: () => debugPrint("HWLLOR"),
                  ))),
        ],
      ),
    );
  }
}
