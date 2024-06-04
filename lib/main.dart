// import 'package:filmbuzz/features/homepage/presentation/pages/homepage.dart';
import 'package:filmbuzz/features/homepage/presentation/pages/homepage.dart';
import 'package:filmbuzz/features/splash/presentation/page/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'public/utils/get_connectivity.dart';
import 'routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final networkController = Get.put(NetworkController());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (networkController.isConnected.value) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.SPLASH,
          defaultTransition: Transition.fade,
          getPages: AppPages.pages,
          home: HomePage(),
        );
      } else {
        return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text('No Internet Connection'),
                  ],
                ),
              ),
            ));
      }
    });
  }
}
