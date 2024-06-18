import 'package:filmbuzz/features/homepage/presentation/get/home_controller.dart';
import 'package:filmbuzz/features/homepage/presentation/get/see_all_controller.dart';
import 'package:filmbuzz/public/model/movie_model.dart';

import 'package:filmbuzz/public/widget/display_movie.dart';
import 'package:filmbuzz/public/widget/pagination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeAll extends StatefulWidget {
  SeeAll({super.key});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  final ScrollController _scrollController = ScrollController();

  final SeeAllController controller = Get.put(SeeAllController());

  var title = Get.arguments[0] as String;

  MovieModel movieData() {
    if (title == 'Now Playing') {
      return controller.nowPlayingMovie.value;
    } else if (title == 'Popular') {
      return controller.popularMovie.value;
    } else if (title == 'Top Rated') {
      return controller.topRatedMovie.value;
    } else if (title == 'Upcoming') {
      return controller.upcomingMovie.value;
    } else {
      return MovieModel();
    }
  }

  void getMovieData(int page) {
    if (title == 'Now Playing') {
      controller.fetchNowPlayingMovie(page);
    } else if (title == 'Popular') {
      controller.fetchPopularMovie(page);
    } else if (title == 'Top Rated') {
      controller.fetchTopRatedMovie(page);
    } else if (title == 'Upcoming') {
      controller.fetchUpcomingMovie(page);
    }
  }

  @override
  void initState() {
    super.initState();
    getMovieData(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          backgroundColor: Theme.of(context).colorScheme.surface,
          centerTitle: true,
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            controller: _scrollController,
            shrinkWrap: true,
            children: [
              Obx(
                () {
                  if (movieData().listMovie == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return DisplayMovie(
                        items: movieData().listMovie!, itemCount: 20);
                  }
                },
              ),
              Obx(() {
                if (movieData().listMovie == null) {
                  return const SizedBox();
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: CustomPagination(
                        onNext: () {
                          getMovieData(movieData().page! + 1);
                          _scrollController.animateTo(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        onPrev: () {
                          if (movieData().page! > 1) {
                            getMovieData(movieData().page! - 1);
                            _scrollController.animateTo(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          }
                        },
                        totalpage: movieData().totalPages!,
                        currentPage: movieData().page!),
                  );
                }
              }),
            ],
          ),
        ));
  }
}
