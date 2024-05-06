import 'package:filmbuzz/features/homepage/presentation/get/home_controller.dart';
import 'package:filmbuzz/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HomeController controller = Get.put(HomeController());

  getData() {}

  @override
  void initState() {
    super.initState();
    // getData();
    controller.fetchTrending();
    controller.fetchPopularMovie(1);
    controller.fetchTopRatedMovie(1);
    controller.fetchUpcomingMovie(1);
    controller.fetchNowPlayingMovie(1);

    Future.delayed(const Duration(seconds: 4), () {
      Get.offAllNamed(Routes.HOME);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Splash Screen'),
    ));
  }
}
