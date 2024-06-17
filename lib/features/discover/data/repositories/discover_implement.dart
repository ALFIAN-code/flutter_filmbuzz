import 'package:filmbuzz/features/discover/data/datasources/remote_datasource.dart';
import 'package:filmbuzz/features/discover/domain/repositories/discover_repository.dart';
import 'package:filmbuzz/public/model/movie_model.dart';

class DiscoverImplement implements DiscoverRepository {
  RemoteDiscoverDatasource remoteDatasource;
  DiscoverImplement(this.remoteDatasource);

  @override
  Future<MovieModel> getDiscover(int page) {
    return remoteDatasource.getDiscoverMovie(page.toString());
  }

  @override
  Future<MovieModel> getDiscoverTv(int page) {
    return remoteDatasource.getDiscoverTv(page.toString());
  }
}
