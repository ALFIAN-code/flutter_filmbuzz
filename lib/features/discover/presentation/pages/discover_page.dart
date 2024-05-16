import 'package:filmbuzz/public/features/navbar/presentation/pages/navbar.dart';
import 'package:filmbuzz/public/style.dart';
import 'package:filmbuzz/public/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Discover ', style: textStyle24Bold),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset('lib/assets/icons/discover bold.svg'),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const SearchCustom()
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: MyNavbar(),
    );
  }
}
