import 'package:filmbuzz/features/detail_movie/data/datasources/remote_details.dart';
import 'package:filmbuzz/features/detail_movie/data/datasources/remote_similar.dart';
import 'package:filmbuzz/features/detail_movie/data/datasources/remote_video.dart';
import 'package:filmbuzz/features/detail_movie/data/models/detail_movie_model.dart';
import 'package:filmbuzz/features/detail_movie/data/models/video_movie.dart';
import 'package:filmbuzz/features/detail_movie/data/repositories/detail_movie_implement.dart';
import 'package:filmbuzz/features/detail_movie/data/repositories/similar_movie_implement.dart';
import 'package:filmbuzz/features/detail_movie/data/repositories/video_movie_implement.dart';
import 'package:filmbuzz/features/detail_movie/domain/usecases/get_detail.dart';
import 'package:filmbuzz/features/detail_movie/domain/usecases/get_similar_movie.dart';
import 'package:filmbuzz/features/detail_movie/domain/usecases/get_video.dart';
import 'package:filmbuzz/public/model/movie_model.dart';
import 'package:get/get.dart';

class DetailController {
  DetailController();

  var movieDetailsData = Rx<MovieDetailsModel>(MovieDetailsModel());
  var similarMovieData = Rx<MovieModel>(MovieModel());
  var videoMovie = <Results>[].obs;

  var videoMovieFiltered = <Results>[].obs;

  final _getDetailMovie = GetDetail(DetailMovieImplement(DetailsRemoteData()));
  final _getSimilarMovie =
      GetSimilarMovie(SimilarMovieImplement(SimilarRemoteData()));

  final _getVideo = GetVideo(VideoMovieImplement(VideoRemoteData()));

  bool isLoading = true;

  var lastVideoSlide = ''.obs;

  Future<void> fetchDetailMovie(int id) async {
    isLoading = true;
    final MovieDetailsModel movie = await _getDetailMovie.get(id);
    movieDetailsData.value = movie;
    isLoading = false;
  }

  Future<void> fetchSimilarMovie(int id) async {
    final MovieModel movie = await _getSimilarMovie.get(id);
    similarMovieData.value = movie;
  }

  Future<void> fetchVideos(int id) async {
    final VideoModel video = await _getVideo.get(id);

    videoMovieFiltered.value = video.results!.where((item) {
      return item.type == 'Trailer' || item.type == 'Teaser';
    }).toList();
    videoMovie.value = video.results!;
  }
}
