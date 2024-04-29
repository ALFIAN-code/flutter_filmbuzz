// import 'package:filmbuzz/features/homepage/presentation/pages/homepage.dart';

import 'package:filmbuzz/features/homepage/data/datasources/remote_home_datasource.dart';
import 'package:filmbuzz/features/homepage/domain/repositories/homepage_repository.dart';
import 'package:filmbuzz/public/model/movie_model.dart';

class HomePageImplement implements HomepageRepository {
  RemoteHomeDatasource remoteHomeDatasource;

  HomePageImplement(this.remoteHomeDatasource);
  @override
  Future<MovieModel> getNowPlaying(String page) async {
    return await remoteHomeDatasource.getNowPlaying(page);
  }

  @override
  Future<MovieModel> getPopular(String page)async {
    return await remoteHomeDatasource.getPopular(page);
  }

  @override
  Future<MovieModel> getTopRated(String page) async{
    return await remoteHomeDatasource.getTopRated(page);
  }

  @override
  Future<MovieModel> getTrending() async{
    return await remoteHomeDatasource.getTrending();
  }

  @override
  Future<MovieModel> getUpcoming(String page) async {
    return await remoteHomeDatasource.getUpcoming(page);
  }

}
