import 'package:filmbuzz/public/features/navbar/presentation/get/navbar_controller.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:filmbuzz/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NavbarItem extends StatelessWidget {
  NavbarItem(
      {super.key,
      required this.routes,
      required this.iconOutline,
      required this.iconBold,
      required this.index,
      required this.title});

  NavbarController controller = Get.put(NavbarController());
  int index;
  String iconOutline;
  String iconBold;
  String title;
  String routes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          controller.onItemTapped(index);
        },
        child: Obx(
          () => (controller.selectedIndex.value == index)
              ? Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          iconBold,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          title,
                          style: textStyle12Semibold,
                        )
                      ],
                    ),
                  ],
                )
              : SvgPicture.asset(iconOutline, fit: BoxFit.cover),
        ));
  }
}
