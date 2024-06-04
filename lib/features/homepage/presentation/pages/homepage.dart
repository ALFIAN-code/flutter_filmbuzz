import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmbuzz/features/homepage/presentation/get/home_controller.dart';
import 'package:filmbuzz/features/homepage/presentation/widgets/carousel_sllider.dart';
import 'package:filmbuzz/features/homepage/presentation/widgets/display_movie.dart';
import 'package:filmbuzz/public/widget/search.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CarouselController carouselController = CarouselController();
  final HomeController controller = Get.put(HomeController());

  void getMovie() {
    controller.fetchTrending();
    controller.fetchPopularMovie(1);
    controller.fetchTopRatedMovie(1);
    controller.fetchUpcomingMovie(1);
    controller.fetchNowPlayingMovie(1);
  }

  @override
  Widget build(BuildContext context) {
    // double deviceHeight = MediaQuery.of(context).size.height;
    // int navbarHeight = 70;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
                child: Stack(children: [
              Align(
                alignment: const Alignment(0, 0),
                child: Obx(
                  () => Container(
                    margin: const EdgeInsets.only(top: 70),
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: controller.currentSliderColor.value
                            .withOpacity(0.8),
                        gradient: RadialGradient(
                            radius: 0.75,
                            center: Alignment.center,
                            colors: [
                              controller.currentSliderColor.value
                                  .withOpacity(0.7),
                              Colors.transparent
                            ])),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  HorintalPadding(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello There",
                                style: textStyle22Bold,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Welcome to Movie World!",
                                style: textStyle14Regular,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          'lib/assets/profile/profile1.svg',
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                  const HorintalPadding(child: SearchCustom()),

                  // =============== CONTENT ===================
                  GetX<HomeController>(
                    init: controller,
                    initState: (state) => getMovie(),
                    builder: (_) {
                      return (controller.nowPlayingMovie.isEmpty ||
                              controller.popularMovie.isEmpty ||
                              controller.topRatedMovie.isEmpty ||
                              controller.trending.isEmpty ||
                              controller.upcomingMovie.isEmpty)
                          ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 200),
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                HorintalPadding(
                                    child: Text(
                                  'Popular',
                                  style: textStyle18Bold,
                                )),
                                const SizedBox(
                                  height: 10,
                                ),
                                MyCarouserlSlider(
                                  homecontroller: controller,
                                  items: controller.trending,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                HorintalPadding(
                                    child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Now Playing",
                                          style: textStyle18Bold,
                                        ),
                                        Text(
                                          "see all",
                                          style: textStyle10Regular.copyWith(
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 770,
                                      child: DisplayMovie(
                                        items: controller.nowPlayingMovie,
                                      ),
                                    ),

                                    //======== TOP RATED ========
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Top Rated",
                                          style: textStyle18Bold,
                                        ),
                                        Text(
                                          "see all",
                                          style: textStyle10Regular.copyWith(
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 770,
                                      child: DisplayMovie(
                                        items: controller.topRatedMovie,
                                      ),
                                    ),

                                    //========  POPULAR ========
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Popular",
                                          style: textStyle18Bold,
                                        ),
                                        Text(
                                          "see all",
                                          style: textStyle10Regular.copyWith(
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 770,
                                      child: DisplayMovie(
                                        items: controller.popularMovie,
                                      ),
                                    ),

                                    //========  UPCOMING ========
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Upcoming",
                                          style: textStyle18Bold,
                                        ),
                                        Text(
                                          "see all",
                                          style: textStyle10Regular.copyWith(
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 770,
                                      child: DisplayMovie(
                                        items: controller.upcomingMovie,
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            );
                    },
                  )
                ],
              ),
            ])),
            // Align(alignment: Alignment.bottomCenter, child: MyNavbar())
          ],
        ),
      ),
    );

    // return ;
  }
}

class HorintalPadding extends StatelessWidget {
  const HorintalPadding({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: child,
    );
  }
}
