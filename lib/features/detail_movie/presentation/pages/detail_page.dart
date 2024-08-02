import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:filmbuzz/features/detail_movie/presentation/getx/detail_movie.dart';
import 'package:filmbuzz/features/detail_movie/presentation/widget/info_phil.dart';
import 'package:filmbuzz/features/detail_movie/presentation/widget/movie_image_backdrop.dart';
import 'package:filmbuzz/features/detail_movie/presentation/widget/toolbar_top.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';

import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Details extends StatefulWidget {
  Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final DetailController detailController = Get.put(DetailController());

  final movieID = Get.arguments;
 

  @override
  void initState() {
    super.initState();
    detailController.fetchDetailMovie(movieID);
    detailController.fetchVideos(movieID);
    detailController.fetchSimilarMovie(movieID);
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    print(movieID);

    // var filteredVideo =
    //     detailController.videoMovie.value.where((item) {
    //   return item.type == 'Trailer' || item.type == 'Teaser';
    // }).toList();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Obx(
        () {
          if (detailController.movieDetailsData.value.posterPath == null ||
              detailController.videoMovie.isEmpty ||
              detailController.similarMovieData.value.listMovie == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: deviceHeight * 0.7,
                      child: Stack(
                        children: [
                          //movie backdrop
                          MovieImageBackdrop(
                              detailController: detailController),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: deviceHeight * 0.5,
                                ),
                                Center(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Text(
                                            detailController.movieDetailsData
                                                    .value.title ??
                                                "loading ....",
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: textStyle24Bold.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface)),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        detailController
                                            .movieDetailsData.value.genres!
                                            .map((e) => e.name)
                                            .join(", "),
                                        style: textStyle14Regular.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      InfoPhil(
                                        detailController: detailController,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //toolbar top
                        ],
                      ),
                    ),

                    //content
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About movie',
                            style: textStyle20Semibold,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            detailController.movieDetailsData.value.overview!,
                            style: textStyle14Regular,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Status ',
                                    style: textStyle14Regular,
                                  ),
                                  Text(
                                    'Spoken Language ',
                                    style: textStyle14Regular,
                                  ),
                                  Text(
                                    'Budget ',
                                    style: textStyle14Regular,
                                  ),
                                  Text(
                                    'Income ',
                                    style: textStyle14Regular,
                                  ),
                                  Text(
                                    'Origin',
                                    style: textStyle14Regular,
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    ': ${detailController.movieDetailsData.value.status}',
                                    style: textStyle14Regular,
                                  ),
                                  Text(
                                    ': ${detailController.movieDetailsData.value.spokenLanguages!.map((e) => e.englishName).join(', ')}',
                                    style: textStyle14Regular,
                                  ),
                                  Text(
                                    ': ${NumberFormat.compactCurrency(symbol: 'USD ').format(detailController.movieDetailsData.value.budget)}',
                                    style: textStyle14Regular,
                                  ),
                                  Text(
                                    ': ${NumberFormat.compactCurrency(symbol: 'USD ').format(detailController.movieDetailsData.value.revenue)}',
                                    style: textStyle14Regular,
                                  ),
                                  Text(
                                    ': ${detailController.movieDetailsData.value.originCountry!.map(
                                      (e) {
                                        print(e);
                                        return Country.tryParse(e)?.name;
                                      },
                                    ).join(", ")}',
                                    style: textStyle14Regular,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Trailer',
                            style: textStyle20Semibold,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CarouselSlider.builder(
                            itemCount: detailController.videoMovieFiltered.length,
                            options: CarouselOptions(
                                autoPlay: false,
                                aspectRatio: 1.0,
                                initialPage: 0,
                                animateToClosest: true,
                                height: 220,
                                enlargeFactor: 0.23,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false),
                            itemBuilder: (context, index, realIndex) {
                              var isCurrentSlide = false;
                              if (detailController.videoMovieFiltered[index].id == detailController.lastVideoSlide.value) {
                                isCurrentSlide = true;
                              }

                              return YoutubePlayerBuilder(
                                player: YoutubePlayer(
                                controller: YoutubePlayerController(initialVideoId: detailController.videoMovieFiltered[index].key!),
                              ), builder: (contex, player) {
                                return Column(
                                  children: [
                                    player
                                  ],
                                );
                              },);
                              // return Container(
                              //   height: 50,
                              //   clipBehavior: Clip.hardEdge,
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(15)),
                              //   child: Image.network(
                              //       fit: BoxFit.cover,
                              //       YoutubePlayer.getThumbnail(
                              //         videoId: detailController.videoMovieFiltered[index].key!,
                              //       )),
                              // );
                            },
                          ),
                          const SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: ToolbarTop(),
              )
            ],
          );
        },
      ),
    );
  }
}
