import 'package:filmbuzz/public/model/movie_model.dart';
import 'package:dio/dio.dart';

class RemoteHomeDatasource {
  final Dio dio = Dio();

  RemoteHomeDatasource() {
    dio.options.baseUrl = 'https://api.themoviedb.org/3';
    dio.options.headers['accept'] = 'application/json';
    dio.options.queryParameters = {
      'api_key': '24a2fdf3a3c4d909ca35f03b72c140b3'
    };
  }

  Future<MovieModel> getTrending() async {
    final response = await dio.get('/trending/movie/week');
    return MovieModel.fromJson(response.data);
  }

  Future<MovieModel> getPopular(String page) async {
    try {
      final response = await dio.get(
        '/movie/popular',
        queryParameters: {'page': page},
      );
      return MovieModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.message!;
    }
  }

  Future<MovieModel> getTopRated(String page) async {
    try {
      final response =
          await dio.get('/movie/top_rated', queryParameters: {'page': page});
      return MovieModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.message!;
    }
  }

  Future<MovieModel> getUpcoming(String page) async {
    try {
      final response =
          await dio.get('/movie/upcoming', queryParameters: {'page': page});
      return MovieModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.message!;
    }
  }

  Future<MovieModel> getNowPlaying(String page) async {
    try {
      final response =
          await dio.get('/movie/now_playing', queryParameters: {'page': page});
      return MovieModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.message!;
    }
  }
}
