// import 'package:filmbuzz/features/homepage/presentation/pages/homepage.dart';
import 'package:filmbuzz/features/homepage/presentation/pages/homepage.dart';
import 'package:filmbuzz/public/features/navbar/presentation/pages/page_switcher.dart';
import 'package:filmbuzz/public/style.dart';
// import 'package:filmbuzz/features/splash/presentation/page/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'public/utils/get_connectivity.dart';
import 'routes/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

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
          navigatorKey: navigatorKey,
          theme: darkTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.PAGE_SWITCHER,
          defaultTransition: Transition.fade,
          getPages: AppPages.pages,
          home: PageSwitcher(),
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
