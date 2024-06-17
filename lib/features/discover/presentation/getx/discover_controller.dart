import 'package:filmbuzz/features/discover/data/datasources/remote_datasource.dart';
import 'package:filmbuzz/features/discover/data/repositories/discover_implement.dart';
import 'package:filmbuzz/features/discover/domain/usecases/get_discover_movie.dart';
import 'package:filmbuzz/public/model/movie_model.dart';
import 'package:get/get.dart';

class DiscoverController extends GetxController {
  var discoverMovie = <ListMovie>[].obs;
  var discoverTV = <ListMovie>[].obs;
  int totalpage = 0;

  var isLoading = false.obs;
  var page = 1.obs;

  final _getDiscoverMovie =
      GetDiscoverMovie(DiscoverImplement(RemoteDiscoverDatasource()));

  getMovieByPage(int page) async {
    final MovieModel movie = await _getDiscoverMovie.getDiscover(page);
    discoverMovie.value = movie.listMovie!;
    totalpage = movie.totalPages!;
  }
}
