import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../public/style.dart';

class MyToolbar extends StatelessWidget {
  MyToolbar({
    super.key,
    required this.icon,
    required this.title,
  });

  Widget icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          SizedBox(height: 18, child: icon),
          const SizedBox(width: 5),
          Text(title, style: textStyle12Semibold)
        ],
      ),
    );
  }
}
