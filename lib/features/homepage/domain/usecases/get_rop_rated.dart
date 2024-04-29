import 'package:filmbuzz/features/homepage/domain/repositories/homepage_repository.dart';
import 'package:filmbuzz/public/model/movie_model.dart';

class GetTopRated {
  final HomepageRepository repository;

  GetTopRated(this.repository);

  Future<MovieModel> call(String page) async {
    try {
      return await repository.getTopRated(page);
    } catch (e) {
      rethrow;
    }
  }
}
