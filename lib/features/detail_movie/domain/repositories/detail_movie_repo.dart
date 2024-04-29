import 'package:filmbuzz/features/detail_movie/data/models/detail_movie_model.dart';

abstract class DetailMovieRepo {
  Future<MovieDetailsModel> getMovieById(int id);
}
