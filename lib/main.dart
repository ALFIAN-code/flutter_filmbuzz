import 'package:filmbuzz/features/homepage/presentation/get/home_binding.dart';
import 'package:filmbuzz/features/homepage/presentation/pages/homepage.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/routes.dart';

void main() {
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.HOME,
        theme: darkThemeData,
        defaultTransition: Transition.fade,
        initialBinding: HomeBinding(),
        getPages: AppPages.pages,
        home: HomePage(),
    )
  );
}
