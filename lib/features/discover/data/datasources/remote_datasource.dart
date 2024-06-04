import 'package:dio/dio.dart';

import '../../../../public/model/movie_model.dart';

class RemoteDiscoverDatasource {
  final Dio dio = Dio();

  RemoteDiscoverDatasource() {
    dio.options.baseUrl = 'https://api.themoviedb.org/3';
    dio.options.headers['accept'] = 'application/json';
    dio.options.queryParameters = {
      'api_key': '24a2fdf3a3c4d909ca35f03b72c140b3'
    };
  }

  Future<MovieModel> getDiscoverMovie(String page) async {
    try {
      final response = await dio.get(
        '/discover/movie',
        queryParameters: {'page': page},
      );
      return MovieModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.message!;
    }
  }

  Future<MovieModel> getDiscoverTv(String page) async {
    try {
      final response = await dio.get(
        '/discover/movie',
        queryParameters: {'page': page},
      );
      return MovieModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.message!;
    }
  }
}
