import 'package:filmbuzz/features/detail_movie/domain/repositories/similar_movie_repo.dart';
import 'package:filmbuzz/public/model/movie_model.dart';

class GetSimilarMovie {
  final SimilarMovieRepo repository;

  GetSimilarMovie(this.repository);

  Future<MovieModel> get (int id) async {
    return await repository.getSimilarMovie(id);
  }
}
