import 'package:filmbuzz/features/homepage/presentation/get/home_controller.dart';
import 'package:filmbuzz/features/homepage/presentation/widgets/carousel_sllider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            
            GetX<HomeController>(
              init: HomeController(),
              initState: (state) => controller.fetchTrending(),
              builder: (_) =>
                  MyCarouserlSlider(items: controller.trending.value),
            )
          ],
        )),
      ),
    );
  }
}
