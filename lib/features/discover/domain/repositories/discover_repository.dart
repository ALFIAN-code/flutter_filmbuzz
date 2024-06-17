import '../../../../public/model/movie_model.dart';

abstract class DiscoverRepository {
  Future<MovieModel> getDiscover(int page);
  Future<MovieModel> getDiscoverTv(int page);
}
