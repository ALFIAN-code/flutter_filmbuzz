// import 'package:filmbuzz/public/features/genre/domain/repository/get_genre.dart';
// import 'package:filmbuzz/public/style.dart';
import 'package:filmbuzz/public/widget/preview_movie.dart';
import 'package:filmbuzz/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/movie_model.dart';

class DisplayMovie extends StatelessWidget {
  const DisplayMovie({super.key, required this.items, required this.itemCount});

  final List<ListMovie> items;

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.67,
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10),
      itemBuilder: (context, index) => DisplayMovieItem(
        movieData: items[index],
        onTap: () {
          Get.toNamed(Routes.MOVIE_DETAILS, arguments: items[index].id);
        },
      ),
    );
  }
}
