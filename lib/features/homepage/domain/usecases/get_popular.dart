import 'package:filmbuzz/features/homepage/domain/repositories/homepage_repository.dart';
import 'package:filmbuzz/public/model/movie_model.dart';

class GetPopular {
  final HomepageRepository repository;

  GetPopular(this.repository);

  Future<MovieModel> call(String page) async {
    try {
      return await repository.getPopular(page);
    } catch (e) {
      rethrow;
    }
  }
}
