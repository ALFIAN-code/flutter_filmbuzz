import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmbuzz/features/detail_movie/presentation/getx/detail_movie.dart';
import 'package:filmbuzz/features/detail_movie/presentation/widget/info_phil.dart';
import 'package:filmbuzz/features/detail_movie/presentation/widget/movie_image_backdrop.dart';
import 'package:filmbuzz/features/detail_movie/presentation/widget/toolbar_top.dart';
import 'package:filmbuzz/features/detail_movie/presentation/widget/trailer_item.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';

import 'package:intl/intl.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'video_page.dart';

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
   var deviceWidth = MediaQuery.of(context).size.width;

    print(movieID);
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
                          SizedBox(
                            width: deviceWidth - 40,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Status ',
                                      style: textStyle14Regular,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Spoken Language ',
                                      style: textStyle14Regular,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Budget ',
                                      style: textStyle14Regular,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Income ',
                                      style: textStyle14Regular,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Origin',
                                      style: textStyle14Regular,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      ': ${detailController.movieDetailsData.value.status}',
                                      style: textStyle14Regular,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      ': ${detailController.movieDetailsData.value.spokenLanguages!.map((e) => e.englishName).join(', ')}',
                                      style: textStyle14Regular,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      ': ${NumberFormat.compactCurrency(symbol: 'USD ').format(detailController.movieDetailsData.value.budget)}',
                                      style: textStyle14Regular,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      ': ${NumberFormat.compactCurrency(symbol: 'USD ').format(detailController.movieDetailsData.value.revenue)}',
                                      style: textStyle14Regular,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      ': ${detailController.movieDetailsData.value.originCountry!.map(
                                        (e) {
                                          print(e);
                                          return Country.tryParse(e)?.name;
                                        },
                                      ).join(", ")}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyle14Regular,
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                            itemCount:
                                detailController.videoMovieFiltered.length,
                            options: CarouselOptions(
                                autoPlay: false,
                                aspectRatio: 1.0,
                                initialPage: 0,
                                animateToClosest: true,
                                height: 220,
                                enlargeFactor: 0.17,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false),
                            itemBuilder: (context, index, realIndex) {
                              return GestureDetector(
                                onTap: () {
                                  print('tapped');
                                  Get.to(() => VideoPlayer(
                                    youtubeKey: detailController
                                        .videoMovieFiltered[index].key!));
                                },
                                child: TrailerItem(detailController: detailController, index: index,));
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


