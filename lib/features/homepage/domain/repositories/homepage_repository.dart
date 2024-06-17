import 'package:filmbuzz/public/model/movie_model.dart';

abstract class HomepageRepository {
  Future<MovieModel> getTrending();

  Future<MovieModel> getPopular(String page);

  Future<MovieModel> getTopRated(String page);

  Future<MovieModel> getUpcoming(String page);

  Future<MovieModel> getNowPlaying(String page);
}
