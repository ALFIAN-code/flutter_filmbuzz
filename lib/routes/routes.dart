import 'package:filmbuzz/features/homepage/presentation/pages/homepage.dart';
import 'package:filmbuzz/features/splash/presentation/page/splash.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(name: Routes.SPLASH, page: () => SplashScreen())
  ];
}

class Routes {
  static const SPLASH = '/';
  static const HOME = '/home';
  static const MOVIE_DETAILS = '/movie-details';
  static const WATCH_LATER = '/watch-later';
  static const DISCOVER = '/discover';
  static const SETTINGS = '/settings';
  static const SEARCH = '/search';
}
