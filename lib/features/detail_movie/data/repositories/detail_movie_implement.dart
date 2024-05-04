// import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:filmbuzz/features/detail_movie/data/datasources/remote_details.dart';
import 'package:filmbuzz/features/detail_movie/data/models/detail_movie_model.dart';
import 'package:filmbuzz/features/detail_movie/domain/repositories/detail_movie_repo.dart';

class DetailMovieImplement implements DetailMovieRepo {
  DetailsRemoteData remoteData;

  DetailMovieImplement(this.remoteData);

  @override
  Future<MovieDetailsModel> getMovieById(int id) async {
    try {
      return remoteData.getMovieById(id);
    }  catch (e) {
      rethrow;
    }
  }
}
