import 'package:filmbuzz/features/detail_movie/presentation/widget/circle_button.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToolbarTop extends StatelessWidget {
  const ToolbarTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 120,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface.withOpacity(0.8),
              Colors.transparent,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const MyCircleButton(
                    icon: Icon(Icons.arrow_back_ios_new_outlined))),
            Text(
              "Details",
              style: textStyle18Semibold,
            ),
            const MyCircleButton(icon: Icon(Icons.favorite_border)),
          ],
        ),
      ),
    );
  }
}
