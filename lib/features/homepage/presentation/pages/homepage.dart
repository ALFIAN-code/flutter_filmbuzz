import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmbuzz/features/homepage/presentation/get/home_controller.dart';
import 'package:filmbuzz/features/homepage/presentation/widgets/carousel_sllider.dart';
import 'package:filmbuzz/public/widget/display_movie.dart';
import 'package:filmbuzz/public/widget/search.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:filmbuzz/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

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
    print('halaman 1 dijalankan');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Stack(children: [
          Obx(
            () => Container(
              margin: const EdgeInsets.only(top: 70),
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: controller.currentSliderColor.value.withOpacity(0.8),
                  gradient: RadialGradient(
                      radius: 0.75,
                      center: Alignment.center,
                      colors: [
                        controller.currentSliderColor.value.withOpacity(0.7),
                        Colors.transparent
                      ])),
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
                      'lib/assets/profile/profile9.svg',
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
                  return (controller.nowPlayingMovie.value.listMovie == null ||
                          controller.popularMovie.value.listMovie == null ||
                          controller.topRatedMovie.value.listMovie == null ||
                          controller.trending.value.listMovie == null ||
                          controller.upcomingMovie.value.listMovie == null)
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
                              'Tranding',
                              style: textStyle18Bold,
                            )),
                            const SizedBox(
                              height: 10,
                            ),
                            MyCarouserlSlider(
                              onTap: () {
                                Get.toNamed(Routes.MOVIE_DETAILS,
                                    arguments: controller
                                        .trending
                                        .value
                                        .listMovie![
                                            controller.activeSlideIndex.value]
                                        .id);
                              },
                              homecontroller: controller,
                              items: controller.trending.value.listMovie!,
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
                                    TextButton(
                                      onPressed: () => Get.toNamed(
                                          Routes.SEE_ALL,
                                          arguments: [
                                            'Now Playing',
                                            controller.nowPlayingMovie.value
                                          ]),
                                      child: Text(
                                        "see all",
                                        style: textStyle10Regular.copyWith(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DisplayMovie(
                                  itemCount: 6,
                                  items: controller
                                      .nowPlayingMovie.value.listMovie!,
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
                                    TextButton(
                                      onPressed: () => Get.toNamed(
                                          Routes.SEE_ALL,
                                          arguments: [
                                            'Top Rated',
                                            controller.topRatedMovie.value
                                          ]),
                                      child: Text(
                                        "see all",
                                        style: textStyle10Regular.copyWith(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DisplayMovie(
                                  itemCount: 6,
                                  items:
                                      controller.topRatedMovie.value.listMovie!,
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
                                    TextButton(
                                      onPressed: () => Get.toNamed(
                                          Routes.SEE_ALL,
                                          arguments: [
                                            'Popular',
                                            controller.popularMovie.value
                                          ]),
                                      child: Text(
                                        "see all",
                                        style: textStyle10Regular.copyWith(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DisplayMovie(
                                  itemCount: 6,
                                  items:
                                      controller.popularMovie.value.listMovie!,
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
                                    TextButton(
                                      onPressed: () => Get.toNamed(
                                          Routes.SEE_ALL,
                                          arguments: [
                                            'Upcoming',
                                            controller.upcomingMovie.value
                                          ]),
                                      child: Text(
                                        "see all",
                                        style: textStyle10Regular.copyWith(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DisplayMovie(
                                  itemCount: 6,
                                  items:
                                      controller.upcomingMovie.value.listMovie!,
                                ),
                              ],
                            )),
                          ],
                        );
                },
              ),
              const SizedBox(
                height: 90,
              )
            ],
          ),
        ])),
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
