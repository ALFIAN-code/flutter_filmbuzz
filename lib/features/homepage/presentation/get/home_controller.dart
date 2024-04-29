import 'package:filmbuzz/features/homepage/domain/repositories/homepage_repository.dart';
import 'package:filmbuzz/public/model/movie_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  final trending = Rx<List<Results>>([]);
  final popularMovie = Rx<List<Results>>([]);
  final topRatedMovie = Rx<List<Results>>([]);
  final upcomingMovie = Rx<List<Results>>([]);
  final nowPlayingMovie = Rx<List<Results>>([]);
  final isLoading = false.obs;
  final _getMovie = HomepageRepository();

  List<Results> trendingSlideList() {
    late var trendingSlide = RxList<Results>([]);
    for (var i = 0; i < 5; i++) {
      trendingSlide.add(trending.value[i]);
    }
    return trendingSlide;
  }

  fetchTrending() async {
    isLoading(true);
    try {
      final MovieModel movie = await _getMovie.getTranding();
      trending.value = movie.results!;
    } finally {
      isLoading(false);
    }
  }

  fetchPopularMovie(int page) async {
    isLoading(true);
    try {
      final movie = await _getMovie.getPopular(page.toString());
      popularMovie.value = movie.results!;
    } finally {
      isLoading(false);
    }
  }

  fetchTopRatedMovie(int page) async {
    isLoading(true);
    try {
      final movie = await _getMovie.getTopRated(page.toString());
      topRatedMovie.value = movie.results!;
    } finally {
      isLoading(false);
    }
  }

  fetchNowPlayingMovie(int page) async {
    isLoading(true);
    try {
      final movie = await _getMovie.getNowPlaying(page.toString());
      nowPlayingMovie.value = movie.results!;
    } finally {
      isLoading(false);
    }
  }

  fetchUpcomingMovie(int page) async {
    isLoading(true);
    try {
      final movie = await _getMovie.getUpcoming(page.toString());
      upcomingMovie.value = movie.results!;
    } finally {
      isLoading(false);
    }
  }
}
