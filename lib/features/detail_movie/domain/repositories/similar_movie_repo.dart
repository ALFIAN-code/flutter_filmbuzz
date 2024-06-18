

import 'package:filmbuzz/public/model/movie_model.dart';

abstract class SimilarMovieRepo {
  Future<MovieModel> getSimilarMovie(int id);
}