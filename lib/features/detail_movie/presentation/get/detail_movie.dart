import 'package:filmbuzz/features/detail_movie/data/datasources/remote_details.dart';
import 'package:filmbuzz/features/detail_movie/data/models/detail_movie_model.dart';
import 'package:filmbuzz/features/detail_movie/data/repositories/detail_movie_implement.dart';
import 'package:filmbuzz/features/detail_movie/domain/usecases/get_detail.dart';
import 'package:get/get.dart';

class GetDetailController {
  GetDetailController();
  var movieDetailsData = Rx<MovieDetailsModel>(MovieDetailsModel());

  final _getDetailMovie = GetDetail(DetailMovieImplement(DetailsRemoteData()));


  Future<void> fetchDetailMovie(int id) async {
    try {
      final MovieDetailsModel movie = await _getDetailMovie.get(id);
      movieDetailsData.value = movie;
    } catch {
      
    }
  }

}
