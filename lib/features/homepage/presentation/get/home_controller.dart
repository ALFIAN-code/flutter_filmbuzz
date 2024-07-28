import 'dart:async';

import 'package:filmbuzz/features/homepage/data/datasources/remote_home_datasource.dart';
import 'package:filmbuzz/features/homepage/data/repository/home_implement.dart';
import 'package:filmbuzz/features/homepage/domain/usecases/get_home_movie.dart';
import 'package:filmbuzz/public/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';

class HomeController extends GetxController {
  HomeController();

  Rx<MovieModel> trending = Rx<MovieModel>(MovieModel());
  Rx<MovieModel> popularMovie = Rx<MovieModel>(MovieModel());
  Rx<MovieModel> topRatedMovie = Rx<MovieModel>(MovieModel());
  Rx<MovieModel> upcomingMovie = Rx<MovieModel>(MovieModel());
  Rx<MovieModel> nowPlayingMovie = Rx<MovieModel>(MovieModel());

  RxInt activeSlideIndex = 0.obs;
  var currentSliderColor = Colors.transparent.obs;

  final _getMovie = GetMovie(HomePageImplement(RemoteHomeDatasource()));

  Future<void> getColorFromImage(String image) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(NetworkImage(image));
    currentSliderColor.value = paletteGenerator.vibrantColor != null
        ? paletteGenerator.vibrantColor!.color
        : paletteGenerator.mutedColor != null
            ? paletteGenerator.mutedColor!.color
            : Colors.white;
  }

  Future<void> fetchTrending() async {
      final MovieModel movie = await _getMovie.getTrending();
      trending.value = movie;
  }

  Future<void> fetchPopularMovie(int page) async {
      final movie = await _getMovie.getPopular(page.toString());
      popularMovie.value = movie;
  }

  Future<void> fetchTopRatedMovie(int page) async {
      final movie = await _getMovie.getTopRated(page.toString());
      topRatedMovie.value = movie;
  }

  Future<void> fetchNowPlayingMovie(int page) async {
      final movie = await _getMovie.getNowPlaying(page.toString());
      nowPlayingMovie.value = movie;
  }

  Future<void> fetchUpcomingMovie(int page) async {
      final movie = await _getMovie.getUpcoming(page.toString());
      upcomingMovie.value = movie;
  }
}
