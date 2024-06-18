import 'package:dio/dio.dart';
import 'package:filmbuzz/features/detail_movie/domain/repositories/similar_movie_repo.dart';
import 'package:filmbuzz/public/model/movie_model.dart';

class SimilarRemoteData implements SimilarMovieRepo {
  SimilarRemoteData() {
    dio.options.baseUrl = 'https://api.themoviedb.org/3';
    dio.options.headers['accept'] = 'application/json';
    dio.options.queryParameters = {
      'api_key': '24a2fdf3a3c4d909ca35f03b72c140b3'
    };
  }

  final dio = Dio();

  @override
  Future<MovieModel> getSimilarMovie(int id) async {
    try {
      final response = await dio.get('/movie/$id/similar');
      return MovieModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.message!;
    }
  }
}
