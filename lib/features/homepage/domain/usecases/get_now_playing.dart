import 'package:filmbuzz/features/homepage/domain/repositories/homepage_repository.dart';

import '../../../../public/model/movie_model.dart';

class GetNowPlaying{
  final HomepageRepository repository;

  GetNowPlaying(this.repository);

  Future<MovieModel> call(String page) async {
    try {
      return await repository.getNowPlaying(page);
    } catch (e) {
      rethrow;
    }
  }
}