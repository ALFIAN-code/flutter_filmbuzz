import 'package:filmbuzz/features/homepage/presentation/pages/homepage.dart';
import 'package:filmbuzz/features/splash/presentation/page/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/routes.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.SPLASH,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    home: const SplashScreen(),
  ));
}
