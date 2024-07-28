
import 'package:filmbuzz/features/detail_movie/data/datasources/remote_video.dart';
import 'package:filmbuzz/features/detail_movie/data/models/video_movie.dart';
import 'package:filmbuzz/features/detail_movie/data/repositories/similar_movie_implement.dart';
import 'package:filmbuzz/features/detail_movie/domain/repositories/video_movie_repo.dart';

class VideoMovieImplement implements VideoMovieRepo {
    final VideoRemoteData remoteData;
    VideoMovieImplement(this.remoteData);

  @override
  Future<VideoModel> getVideo(int id) {
    try {
      return remoteData.getVideo(id);
    } catch (e) {
      rethrow;
    }
  }



}