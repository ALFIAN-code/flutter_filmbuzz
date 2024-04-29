import 'package:filmbuzz/features/detail_movie/domain/repositories/detail_movie_repo.dart';
import '../../data/models/detail_movie_model.dart';

class GetDetail {
  final DetailMovieRepo detailMovieRepo;
  const GetDetail(this.detailMovieRepo);

  Future<MovieDetailsModel> get(int id) async {
    return await detailMovieRepo.getMovieById(id);
  }
}
