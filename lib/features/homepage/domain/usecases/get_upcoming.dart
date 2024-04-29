import 'package:filmbuzz/features/homepage/domain/repositories/homepage_repository.dart';
import 'package:filmbuzz/public/model/movie_model.dart';

class GetUpcoming {
  final HomepageRepository repository;

  GetUpcoming(this.repository);

  Future<MovieModel> call(String page) async {
    try {
      return await repository.getUpcoming(page);
    } catch (e) {
      rethrow;
    }
  }
}
