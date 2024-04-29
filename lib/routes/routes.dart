import 'package:filmbuzz/features/homepage/presentation/get/home_binding.dart';
import 'package:filmbuzz/features/homepage/presentation/get/home_controller.dart';
import 'package:filmbuzz/features/homepage/presentation/pages/homepage.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}

class Routes {
  static const HOME = '/';
  static const MOVIE_DETAILS = '/movie-details';
  static const WATCH_LATER = '/watch-later';
  static const DISCOVER = '/discover';
  static const SETTINGS = '/settings';
    static const SEARCH = '/search';
}
