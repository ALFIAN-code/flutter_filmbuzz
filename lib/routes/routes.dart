import 'package:filmbuzz/features/discover/presentation/pages/discover_page.dart';
import 'package:filmbuzz/features/homepage/presentation/pages/homepage.dart';
import 'package:filmbuzz/features/setting/presentation/pages/setting_page.dart';
import 'package:filmbuzz/features/splash/presentation/page/splash.dart';
import 'package:filmbuzz/features/watchlist/presentation/pages/watchlist_page.dart';
import 'package:filmbuzz/public/features/navbar/presentation/pages/page_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.SPLASH, page: () => const SplashScreen()),
    GetPage(name: Routes.WATCHLIST, page: () => const WatchlistPage()),
    GetPage(name: Routes.DISCOVER, page: () => const DiscoverPage()),
    GetPage(name: Routes.SETTINGS, page: () => const SettingPage()),
    GetPage(name: Routes.PAGE_SWITCHER, page: () => PageSwitcher()),
  ];
}

class Routes {
  static const SPLASH = '/';
  static const HOME = '/home';
  static const MOVIE_DETAILS = '/movie-details';
  static const WATCHLIST = '/watchlist';
  static const DISCOVER = '/discover';
  static const SETTINGS = '/settings';
  static const SEARCH = '/search';
  static const PAGE_SWITCHER = '/page_switcher';
}
