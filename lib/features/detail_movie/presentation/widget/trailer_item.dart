
import 'package:filmbuzz/features/detail_movie/presentation/getx/detail_movie.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TrailerItem extends StatelessWidget {
  const TrailerItem({
    super.key,
    required this.detailController,
    required this.index
  });

  final DetailController detailController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Image.network(
            fit: BoxFit.cover,
YoutubePlayerController.getThumbnail(videoId: detailController.videoMovieFiltered[index].key!),
            errorBuilder: (BuildContext context,
                Object exception,
                StackTrace? stackTrace) {
              return Container(
                color: Colors.grey,
                child: const Center(child: Text('Can"t Load Image')));
            },
          ),
          Container(
            // height: 20,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 20
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0)
              ])
            ),
            child: Text(detailController
                  .videoMovieFiltered[index].name!, 
                  style: textStyle14Regular,
                  maxLines: 2,
                  ),
          ),
          Center(
            child: Icon(
            Icons.play_arrow_rounded,
            color: Colors.white.withOpacity(0.8),
            size: 80,
            ),
          )
        ],
      ),
    );
  }
}