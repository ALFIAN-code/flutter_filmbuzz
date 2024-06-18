import 'dart:async';

import 'package:filmbuzz/features/homepage/data/datasources/remote_home_datasource.dart';
import 'package:filmbuzz/features/homepage/data/repository/home_implement.dart';
import 'package:filmbuzz/features/homepage/domain/usecases/get_home_movie.dart';
import 'package:filmbuzz/public/model/movie_model.dart';
import 'package:get/get.dart';

class SeeAllController extends GetxController {
  SeeAllController();

  Rx<MovieModel> trending = Rx<MovieModel>(MovieModel());
  Rx<MovieModel> popularMovie = Rx<MovieModel>(MovieModel());
  Rx<MovieModel> topRatedMovie = Rx<MovieModel>(MovieModel());
  Rx<MovieModel> upcomingMovie = Rx<MovieModel>(MovieModel());
  Rx<MovieModel> nowPlayingMovie = Rx<MovieModel>(MovieModel());

  final _getMovie = GetMovie(HomePageImplement(RemoteHomeDatasource()));

  Future<void> fetchTrending() async {
    // isLoading(true);
    try {
      final MovieModel movie = await _getMovie.getTrending();
      trending.value = movie;
    } finally {
      // isLoading(false);
    }
  }

  Future<void> fetchPopularMovie(int page) async {
    // isLoading(true);
    try {
      final movie = await _getMovie.getPopular(page.toString());
      popularMovie.value = movie;
    } finally {
      // isLoading(false);
    }
  }

  Future<void> fetchTopRatedMovie(int page) async {
    // isLoading(true);
    try {
      final movie = await _getMovie.getTopRated(page.toString());
      topRatedMovie.value = movie;
    } finally {
      // isLoading(false);
    }
  }

  Future<void> fetchNowPlayingMovie(int page) async {
    // isLoading(true);
    try {
      final movie = await _getMovie.getNowPlaying(page.toString());
      nowPlayingMovie.value = movie;
    } finally {
      // isLoading(false);
    }
  }

  Future<void> fetchUpcomingMovie(int page) async {
    // isLoading(true);
    try {
      final movie = await _getMovie.getUpcoming(page.toString());
      upcomingMovie.value = movie;
    } finally {
      // isLoading(false);
    }
  }
}
