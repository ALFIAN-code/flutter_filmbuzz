import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:filmbuzz/features/detail_movie/presentation/getx/detail_movie.dart';
import 'package:flutter/material.dart';

class MovieImageBackdrop extends StatelessWidget {
  const MovieImageBackdrop({super.key, required this.detailController});
  final DetailController detailController;

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
          height: deviceHeight * 0.7,
          width: double.infinity,
          child: Image.network(
            "https://image.tmdb.org/t/p/w500/${detailController.movieDetailsData.value.posterPath}",
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: FancyShimmerImage(
                    imageUrl:
                        "https://image.tmdb.org/t/p/w500/${detailController.movieDetailsData.value.posterPath}",
                    shimmerBaseColor: Theme.of(context).colorScheme.primary,
                  ),
                );
              }
            },
            fit: BoxFit.cover,
          ),
        ),

        //black gradient Bottom
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 450,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Theme.of(context).colorScheme.surface,
                    Theme.of(context).colorScheme.surface.withOpacity(0.7),
                    Theme.of(context).colorScheme.surface.withOpacity(0),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
