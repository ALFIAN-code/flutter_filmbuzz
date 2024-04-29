import 'package:filmbuzz/public/model/movie_model.dart';
import 'package:filmbuzz/features/homepage/data/datasources/home_api.dart';

class HomepageRepository {
  final HomeApi api = HomeApi();

  getTranding() async {
    return await api.getTranding();
  }

  getPopular(String page) async {
    return await api.getPopular(page);
  }

  getTopRated(String page) async {
    return await api.getTopRated(page);
  }

  getUpcoming(String page) async {
    return await api.getUpcoming(page);
  }

  getNowPlaying(String page) async {
    return await api.getNowPlaying(page);
  }
}
