import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:filmbuzz/public/features/genre/domain/repository/get_genre.dart';
import 'package:filmbuzz/public/model/movie_model.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:flutter/material.dart';

class DisplayMovieItem extends StatelessWidget {
  const DisplayMovieItem({
    super.key,
    required this.movieData,
  });
  final ListMovie movieData;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w400/${movieData.posterPath!}',
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return FancyShimmerImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w400/${movieData.posterPath!}',
                  shimmerBaseColor: Theme.of(context).colorScheme.primary,
                );
              }
            },
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 140,
                    child: Text(
                      movieData.title!,
                      style: textStyle12Bold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: 130,
                  child: Text(
                    GetGenre.getFromListId(movieData.genreIds!).join(', '),
                    style: textStyle10Regular,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.yellow,
                      size: 18,
                    ),
                    Text(
                      movieData.voteAverage!.toStringAsFixed(1),
                      style: textStyle10Semibold,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
