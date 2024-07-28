import 'package:filmbuzz/features/detail_movie/data/models/video_movie.dart';
import 'package:filmbuzz/features/detail_movie/domain/repositories/video_movie_repo.dart';

class GetVideo {
  final VideoMovieRepo repository;

  GetVideo(this.repository);

  Future<VideoModel> get (int id) async {
    return await repository.getVideo(id);
  }
}