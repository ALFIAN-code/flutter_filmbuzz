import 'dart:ui';

import 'package:filmbuzz/public/features/navbar/presentation/widget/navbar_item.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:filmbuzz/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyNavbar extends StatelessWidget {
  const MyNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      height: 60,
      width: double.infinity,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(),
          ),
          Container(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavbarItem(
                routes: Routes.HOME,
                iconOutline: 'lib/assets/icons/home 1 outline.svg',
                iconBold: 'lib/assets/icons/home bold.svg',
                index: 0,
                title: 'Home',
              ),
              NavbarItem(
                routes: Routes.DISCOVER,
                iconOutline: 'lib/assets/icons/discover outline.svg',
                iconBold: 'lib/assets/icons/discover bold.svg',
                index: 1,
                title: 'Discover',
              ),
              NavbarItem(
                routes: Routes.WATCHLIST,
                iconOutline: 'lib/assets/icons/bookmark outline.svg',
                iconBold: 'lib/assets/icons/bookmark 1 bold.svg',
                index: 2,
                title: 'Watchlist',
              ),
              NavbarItem(
                  routes: Routes.SETTINGS,
                  iconOutline: 'lib/assets/icons/setting outline.svg',
                  iconBold: 'lib/assets/icons/setting bold.svg',
                  index: 3,
                  title: 'Setting')
            ],
          ),
        ],
      ),
    );
  }
}
