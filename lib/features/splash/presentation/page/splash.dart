import 'package:filmbuzz/features/homepage/presentation/get/home_controller.dart';
import 'package:filmbuzz/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../public/utils/get_connectivity.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  HomeController controller = Get.put(HomeController());

  @override
  void initState(){
    super.initState();
    controller.fetchTrending();
    controller.fetchPopularMovie(1);
    controller.fetchTopRatedMovie(1);
    controller.fetchUpcomingMovie(1);
    controller.fetchNowPlayingMovie(1);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.nowPlayingMovie.isNotEmpty ||
          controller.popularMovie.isNotEmpty ||
          controller.topRatedMovie.isNotEmpty ||
          controller.trending.isNotEmpty ||
          controller.upcomingMovie.isNotEmpty) {
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAllNamed(Routes.PAGE_SWITCHER);
        });
        // Get.offAllNamed(Routes.HOME);
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
