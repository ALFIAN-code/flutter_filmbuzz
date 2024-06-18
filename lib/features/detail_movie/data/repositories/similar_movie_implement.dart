import 'package:filmbuzz/features/detail_movie/data/datasources/remote_similar.dart';
import 'package:filmbuzz/features/detail_movie/domain/repositories/similar_movie_repo.dart';
import 'package:filmbuzz/public/model/movie_model.dart';

class SimilarMovieImplement implements SimilarMovieRepo {
  SimilarMovieImplement(this.remoteData);

  final SimilarRemoteData remoteData;

  @override
  Future<MovieModel> getSimilarMovie(int id) async {
    try {
      return remoteData.getSimilarMovie(id);
    } catch (e) {
      rethrow;
    }
  }
}