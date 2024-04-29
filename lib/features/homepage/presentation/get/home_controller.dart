import 'package:filmbuzz/features/homepage/data/datasources/remote_home_datasource.dart';
import 'package:filmbuzz/features/homepage/data/repository/home_implement.dart';
import 'package:filmbuzz/features/homepage/domain/repositories/homepage_repository.dart';
import 'package:filmbuzz/features/homepage/domain/usecases/get_home_movie.dart';
import 'package:filmbuzz/public/model/movie_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  final trending = Rx<List<ListMovie>>([]);
  final popularMovie = Rx<List<ListMovie>>([]);
  final topRatedMovie = Rx<List<ListMovie>>([]);
  final upcomingMovie = Rx<List<ListMovie>>([]);
  final nowPlayingMovie = Rx<List<ListMovie>>([]);
  final isLoading = false.obs;
  final _getMovie = GetMovie(HomePageImplement(RemoteHomeDatasource()));

  List<ListMovie> trendingSlideList() {
    late var trendingSlide = RxList<ListMovie>([]);
    for (var i = 0; i < 5; i++) {
      trendingSlide.add(trending.value[i]);
    }
    return trendingSlide;
  }

  fetchTrending() async {
    isLoading(true);
    try {
      final MovieModel movie = await _getMovie.getTrending();
      trending.value = movie.listMovie!;
    } finally {
      isLoading(false);
    }
  }

  fetchPopularMovie(int page) async {
    isLoading(true);
    try {
      final movie = await _getMovie.getPopular(page.toString());
      popularMovie.value = movie.listMovie!;
    } finally {
      isLoading(false);
    }
  }

  fetchTopRatedMovie(int page) async {
    isLoading(true);
    try {
      final movie = await _getMovie.getTopRated(page.toString());
      topRatedMovie.value = movie.listMovie!;
    } finally {
      isLoading(false);
    }
  }

  fetchNowPlayingMovie(int page) async {
    isLoading(true);
    try {
      final movie = await _getMovie.getNowPlaying(page.toString());
      nowPlayingMovie.value = movie.listMovie!;
    } finally {
      isLoading(false);
    }
  }

  fetchUpcomingMovie(int page) async {
    isLoading(true);
    try {
      final movie = await _getMovie.getUpcoming(page.toString());
      upcomingMovie.value = movie.listMovie!;
    } finally {
      isLoading(false);
    }
  }
}
