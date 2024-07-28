import 'package:filmbuzz/features/detail_movie/data/models/video_movie.dart';
import 'package:filmbuzz/features/detail_movie/domain/repositories/video_movie_repo.dart';
import 'package:dio/dio.dart';

class VideoRemoteData implements VideoMovieRepo{
  VideoRemoteData(){
    dio.options.baseUrl = 'https://api.themoviedb.org/3';
   dio.options.headers['accept'] = 'application/json';
   dio.options.queryParameters = {
    'api_key': '24a2fdf3a3c4d909ca35f03b72c140b3'
   };
  }

  final dio = Dio();

  @override
  Future<VideoModel> getVideo(int id ) async {
    try {
      final response = await dio.get('/movie/$id/videos', queryParameters:{'language':'en-US'} );
      return VideoModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.message!;
    }
  }

  
}