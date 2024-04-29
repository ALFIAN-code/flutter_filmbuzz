import 'package:filmbuzz/features/homepage/domain/repositories/homepage_repository.dart';
import 'package:filmbuzz/public/model/movie_model.dart';

class GetTrending{
  final HomepageRepository repository;

  GetTrending(this.repository);

  Future<MovieModel> call() async {
    return await repository.getTrending();
  }
}