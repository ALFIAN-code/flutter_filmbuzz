import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmbuzz/public/model/movie_model.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:filmbuzz/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get.dart';

import '../../../../public/features/genre/domain/repository/get_genre.dart';
import '../get/home_controller.dart';

class MyCarouserlSlider extends StatelessWidget {
  MyCarouserlSlider({
    super.key,
    required this.items,
    required this.homecontroller,
  });

  final List<ListMovie> items;
  HomeController homecontroller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: items.length,
        itemBuilder: (context, index, realIndex) {
          List<String> genreList = GetGenre.getFromListId(
            items[index].genreIds!,
          );
          homecontroller.getColorFromImage(
              "https://image.tmdb.org/t/p/w400/${items[(index == 0) ? 19 : index - 1].backdropPath}");
          return Stack(children: [
            Container(
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w400/${items[index].backdropPath}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.1),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 30,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 230,
                      child: Text(
                        items[index].title!,
                        style: textStyle16Bold,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      genreList.join(', '),
                      style: textStyle10Regular,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                        width: 200,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.6),
                              child: Text(
                                '${items[index].voteAverage?.toStringAsFixed(1)}',
                                style: textStyle12Bold,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ))
                  ]),
            ),
            Material(
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.hardEdge,
              color: Colors.transparent,
              child: InkWell(
                splashColor:
                    Theme.of(context).colorScheme.secondary.withOpacity(.4),
                onTap: () {
                  Get.toNamed(Routes.MOVIE_DETAILS, arguments: items[index].id);
                },
              ),
            )
          ]);
        },
        options: CarouselOptions(
            autoPlay: true,
            // height: 168,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            initialPage: 1));
  }
}
