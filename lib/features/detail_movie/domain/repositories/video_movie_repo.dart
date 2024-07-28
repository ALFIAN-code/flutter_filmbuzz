import 'package:filmbuzz/features/detail_movie/data/models/video_movie.dart';

abstract class VideoMovieRepo {
  Future<VideoModel> getVideo(int id);
}