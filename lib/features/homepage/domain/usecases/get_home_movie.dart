import 'package:filmbuzz/features/homepage/domain/repositories/homepage_repository.dart';
import 'package:filmbuzz/public/model/movie_model.dart';

class GetMovie {
  final HomepageRepository repository;

  GetMovie(this.repository);

  Future<MovieModel> getPopular(String page) async {
    return await repository.getPopular(page);
  }

  Future<MovieModel> getNowPlaying(String page) async {
    return await repository.getNowPlaying(page);
  }

  Future<MovieModel> getTopRated(String page) async {
    return await repository.getTopRated(page);
  }

  Future<MovieModel> getUpcoming(String page) async {
    return await repository.getUpcoming(page);
  }

  Future<MovieModel> getTrending() async {
    return await repository.getTrending();
  }
}
