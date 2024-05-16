import 'package:filmbuzz/public/features/genre/domain/repository/get_genre.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:flutter/material.dart';

import '../../../../public/model/movie_model.dart';

class DisplayMovie extends StatelessWidget {
  DisplayMovie({super.key, required this.items});

  List<ListMovie> items;
 
  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.67,
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10),
      children: items.sublist(0, 6).map((e) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w400/${e.posterPath!}',
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
                          e.title!,
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
                        GetGenre.getFromListId(e.genreIds!).join(', '),
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
                          e.voteAverage!.toStringAsFixed(1),
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
      }).toList(),
    );
  }
}
