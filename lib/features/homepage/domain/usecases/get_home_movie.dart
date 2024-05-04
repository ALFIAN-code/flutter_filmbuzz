import 'package:filmbuzz/features/homepage/domain/repositories/homepage_repository.dart';
import 'package:filmbuzz/public/model/movie_model.dart';

class GetMovie {
  final HomepageRepository repository;

  GetMovie(this.repository);

  Future<MovieModel> getPopular(String page) async {
    try {
      return await repository.getPopular(page);
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieModel> getNowPlaying(String page) async {
    try {
      return await repository.getNowPlaying(page);
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieModel> getTopRated(String page) async {
    try {
      return await repository.getTopRated(page);
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieModel> getUpcoming(String page) async {
    try {
      return await repository.getUpcoming(page);
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieModel> getTrending() async {
    try {
      return await repository.getTrending();
    } catch (e) {
      rethrow;
    }
  }
}
