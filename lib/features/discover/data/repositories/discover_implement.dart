import 'package:filmbuzz/features/discover/data/datasources/remote_datasource.dart';
import 'package:filmbuzz/features/discover/domain/repositories/discover_repository.dart';
import 'package:filmbuzz/public/model/movie_model.dart';

class DiscoverImplement implements DiscoverRepository {
  RemoteDiscoverDatasource remoteDatasource;
  DiscoverImplement(this.remoteDatasource);

  @override
  Future<MovieModel> getDiscover(String page) {
    return remoteDatasource.getDiscoverMovie(page);
  }

  @override
  Future<MovieModel> getDiscoverTv(String page) {
    return remoteDatasource.getDiscoverTv(page);
  }
}
