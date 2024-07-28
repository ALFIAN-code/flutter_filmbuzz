import 'dart:ui';

import 'package:filmbuzz/features/detail_movie/presentation/getx/detail_movie.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:flutter/material.dart';

class InfoPhil extends StatelessWidget {
  final DetailController detailController;

  const InfoPhil({super.key, required this.detailController});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 250,
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: IntrinsicWidth(
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          detailController.movieDetailsData.value.voteAverage
                              .toString()
                              .substring(0, 3),
                          style: textStyle16Semibold.copyWith(
                              color: Theme.of(context).colorScheme.onSurface),
                        ),
                      ],
                    ),
                    Text(
                      'Rating',
                      textAlign: TextAlign.center,
                      style: textStyle12Regular.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .inversePrimary
                              .withOpacity(0.6)),
                    )
                  ],
                ),
                Container(
                  height: 32,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10000),
                      border: Border(
                          left: BorderSide(
                              color: Colors.white.withOpacity(0.3),
                              width: 2.5))),
                ),
                Column(
                  children: [
                    Text(
                      DateTime.parse(detailController
                              .movieDetailsData.value.releaseDate!)
                          .year
                          .toString(),
                      style: textStyle16Semibold,
                    ),
                    Text(
                      'Release',
                      style: textStyle12Regular.copyWith(
                          color: Colors.white.withOpacity(0.6)),
                    )
                  ],
                ),
                Container(
                  height: 32,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10000),
                      border: Border(
                          left: BorderSide(
                              color: Colors.white.withOpacity(0.3),
                              width: 2.5))),
                ),
                Column(
                  children: [
                    Text(
                      detailController.movieDetailsData.value.popularity!
                          .round()
                          .toString(),
                      style: textStyle16Semibold,
                    ),
                    Text(
                      'Popularity',
                      style: textStyle12Regular.copyWith(
                          color: Colors.white.withOpacity(0.6)),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
