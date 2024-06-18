import 'package:filmbuzz/features/detail_movie/presentation/pages/detail_page.dart';
import 'package:filmbuzz/features/discover/presentation/pages/discover_page.dart';
import 'package:filmbuzz/features/homepage/presentation/pages/homepage.dart';
import 'package:filmbuzz/features/homepage/presentation/pages/see_all.dart';
import 'package:filmbuzz/features/setting/presentation/pages/setting_page.dart';
import 'package:filmbuzz/features/watchlist/presentation/pages/watchlist_page.dart';
import 'package:filmbuzz/public/features/navbar/presentation/pages/page_switcher.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.SEE_ALL, page: () => SeeAll()),
    GetPage(name: Routes.MOVIE_DETAILS, page: () => Details()),
    GetPage(name: Routes.WATCHLIST, page: () => const WatchlistPage()),
    GetPage(name: Routes.DISCOVER, page: () => const DiscoverPage()),
    GetPage(name: Routes.SETTINGS, page: () => const SettingPage()),
    GetPage(name: Routes.PAGE_SWITCHER, page: () => PageSwitcher()),
  ];
}

class Routes {
  static const SEE_ALL = '/see_all';
  static const HOME = '/home';
  static const MOVIE_DETAILS = '/movie-details';
  static const WATCHLIST = '/watchlist';
  static const DISCOVER = '/discover';
  static const SETTINGS = '/settings';
  static const SEARCH = '/search';
  static const PAGE_SWITCHER = '/page_switcher';
}
