import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmbuzz/features/homepage/presentation/get/home_controller.dart';
import 'package:filmbuzz/features/homepage/presentation/widgets/carousel_sllider.dart';
import 'package:filmbuzz/features/homepage/presentation/widgets/search.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CarouselController carouselController = CarouselController();

  final HomeController controller = Get.put(HomeController());

  var imageColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    // currentImageColor();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Stack(children: [
          GetX(
            init: HomeController(),
            builder: (controller) {
              return Align(
                alignment: const Alignment(0, 0),
                child: Container(
                  height: 1000,
                  width: 1000,
                  decoration:
                      BoxDecoration(color: controller.currentSliderColor.value
                          // gradient: RadialGradient(
                          //     center: Alignment.center,
                          //     colors: [
                          //   controller.currentSliderColor.value,
                          //   Colors.transparent
                          // ])
                          ),
                ),
              );
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HorintalPadding(
                          child: Text(
                            "Hello There",
                            style: textStyle22Bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        HorintalPadding(
                          child: Text(
                            "Welcome to Movie World!",
                            style: textStyle14Regular,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    'lib/assets/profile/profile1.svg',
                    height: 50,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              const HorintalPadding(child: SearchCustom()),
              const SizedBox(
                height: 20,
              ),
              GetX<HomeController>(
                init: HomeController(),
                initState: (state) => state.controller!.fetchTrending(),
                builder: (_) => MyCarouserlSlider(
                  homecontroller: controller,
                  items: _.trending.value,
                ),
              ),
            ],
          ),
          Container(
            height: 50,
            width: 50,
            color: Colors.amber,
          ),
        ])),
      ),
    );
  }
}

class HorintalPadding extends StatelessWidget {
  const HorintalPadding({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: child,
    );
  }
}
