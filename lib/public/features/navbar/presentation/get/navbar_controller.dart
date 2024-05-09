import 'package:get/get.dart';

class NavbarController extends GetxController {
  final selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
