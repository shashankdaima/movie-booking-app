import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_booking_app/services/api_services/api_service.dart';
import 'package:movie_booking_app/utils/api_response.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int carouselIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // test();
  }

  // test() async {
  //   final apiService = ApiService();
  //   final response = await apiService.getThumbnails();
  //   debugPrint(response.status.toString());
  //   // if (response.status == ApiResponse.success) {
  //   debugPrint(response.data![0].launch_url.toString());
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          CarouselSlider(
            options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                enlargeFactor: 0.3,
                onPageChanged: ((index, reason) =>
                    setState(() => {carouselIndex = index}))),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'text $i',
                        style: TextStyle(fontSize: 16.0),
                      ));
                },
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: Center(
                child: AnimatedSmoothIndicator(
              activeIndex: carouselIndex,
              count: 5,
              effect: const ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 14,
                  activeDotColor: Color(0xFF4D438A),
                  dotColor: Color(0xFF2A2740)),
            )),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Text("Currently Showing",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                for (int i = 0; i < 10; i++) MovieOverview(),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Text("Coupons and Vouchers",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
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
  const MovieOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(
                height: 10,
              ),
              Text(
                "Avenger's Endgame",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              Text("4.5/5"),
            ],
          ),
        ),
        Positioned.fill(
            child: Material(
                borderRadius: BorderRadius.circular(8),
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                child: new InkWell(
                  highlightColor: Color.fromARGB(105, 0, 0, 0),
                  onTap: () => debugPrint("HWLLOR"),
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
