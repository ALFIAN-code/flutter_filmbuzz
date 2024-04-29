import 'package:filmbuzz/features/detail_movie/data/models/detail_movie_model.dart';
import 'package:filmbuzz/features/detail_movie/domain/repositories/detail_movie_repo.dart';
import 'package:dio/dio.dart';

class DetailsRemoteData implements DetailMovieRepo {
  final Dio dio = Dio();

  DetailsRemoteData() {
    dio.options.baseUrl = 'https://api.themoviedb.org/3';
    dio.options.headers['accept'] = 'application/json';
    dio.options.queryParameters = {
      'api_key': '24a2fdf3a3c4d909ca35f03b72c140b3'
    };
  }

  @override
  Future<MovieDetailsModel> getMovieById(int id) async {
    try {
      final response =
          await dio.get('/movie/$id', queryParameters: {'language': 'en-US'});
      return MovieDetailsModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.message!;
    }
  }
}
