import 'package:filmbuzz/features/discover/presentation/pages/discover_page.dart';
import 'package:filmbuzz/features/homepage/presentation/pages/homepage.dart';
import 'package:filmbuzz/features/setting/presentation/pages/setting_page.dart';
import 'package:filmbuzz/features/watchlist/presentation/pages/watchlist_page.dart';
import 'package:filmbuzz/public/features/navbar/presentation/get/navbar_controller.dart';
import 'package:filmbuzz/public/features/navbar/presentation/pages/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:get/get.dart';

class PageSwitcher extends StatelessWidget {
  PageSwitcher({super.key});
  late var controller = Get.put(NavbarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Obx(() => LazyIndexedStack(
                index: controller.selectedIndex.value,
                children: [
                  HomePage(),
                  DiscoverPage(),
                  const WatchlistPage(),
                  const SettingPage()
                ],
              )),
          const Align(alignment: Alignment.bottomCenter, child: MyNavbar())
        ],
      ),
    );
  }
}
