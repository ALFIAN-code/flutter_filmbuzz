import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmbuzz/public/model/movie_model.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../public/features/genre/domain/repository/get_genre.dart';

class MyCarouserlSlider extends StatelessWidget {
  const MyCarouserlSlider({super.key, required this.items});

  final List<Results> items;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: items.map((i) {
          List<String> genreList = GetGenre.getFromListId(i.genreIds!);
          return Builder(
            builder: (BuildContext context) {
              return Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/w400/${i.backdropPath}"),
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
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              i.title!,
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
                                    '${i.voteAverage?.toStringAsFixed(1)}',
                                    style: textStyle12Regular,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
            autoPlay: true,
            // height: 168,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            initialPage: 2));
  }
}