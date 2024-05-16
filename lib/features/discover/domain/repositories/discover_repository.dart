import '../../../../public/model/movie_model.dart';

abstract class DiscoverRepository {
  Future<MovieModel> getDiscover(String page);
  Future<MovieModel> getDiscoverTv(String page);
}