import 'package:filmbuzz/features/discover/presentation/getx/discover_controller.dart';
import 'package:filmbuzz/public/widget/pagination.dart';

import 'package:filmbuzz/public/style.dart';
import 'package:filmbuzz/public/widget/display_movie.dart';
import 'package:filmbuzz/public/widget/search.dart';
import 'package:filmbuzz/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../widgets/toolbar.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  var controller = Get.put(DiscoverController());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.getMovieByPage(controller.page.value);
  }

  _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
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
                const SearchCustom(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    MyToolbar(
                      icon: SvgPicture.asset(
                        'lib/assets/icons/Filter 5.svg',
                        height: 18,
                        fit: BoxFit.cover,
                      ),
                      title: 'Filter',
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    MyToolbar(
                      icon: SvgPicture.asset(
                        'lib/assets/icons/Filter 3.svg',
                        height: 18,
                        fit: BoxFit.cover,
                      ),
                      title: 'Sort',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  if (controller.discoverMovie.isNotEmpty) {
                    return Column(
                      children: [
                        DisplayMovie(
                            items: controller.discoverMovie,
                            itemCount: controller.discoverMovie.length),
                        CustomPagination(
                            onNext: () {
                              controller.page.value++;
                              controller.getMovieByPage(controller.page.value);
                              _scrollToTop();
                            },
                            onPrev: () {
                              controller.page.value--;
                              controller.getMovieByPage(controller.page.value);
                              _scrollToTop();
                            },
                            totalpage: controller.totalpage,
                            currentPage: controller.page.value),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
