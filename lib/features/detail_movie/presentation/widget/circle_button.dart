import 'dart:ui';

import 'package:flutter/material.dart';

class MyCircleButton extends StatelessWidget {
  const MyCircleButton({super.key, required this.icon});
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
      
        shape: BoxShape.circle,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.2),
        //     blurRadius: 6,
        //     offset: const Offset(0, 3),
        // //   ),
        // ],
      ),
      child:Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(),
          ),
          Container(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          ),
          Center(
            child: icon,
          )
        ],
      )
    );
  }
}