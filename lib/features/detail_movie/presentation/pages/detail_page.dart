import 'package:filmbuzz/features/detail_movie/presentation/getx/detail_movie.dart';
import 'package:filmbuzz/features/detail_movie/presentation/widget/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Details extends StatefulWidget {
  Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final DetailController detailController = Get.put(DetailController());

  final movieID = Get.arguments;

  @override
  void initState() {
    super.initState();
    detailController.fetchDetailMovie(movieID);
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Obx(
        () {
          if (detailController.movieDetailsData.value.posterPath == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: deviceHeight * 0.7,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: deviceHeight * 0.7,
                        width: double.infinity,
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500/${detailController.movieDetailsData.value.posterPath!}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
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
                          child: const Row(
                            children: [
                              MyCircleButton(icon: Icon(Icons.arrow_back_ios_new_outlined)),
                               Spacer(),
                              MyCircleButton(icon: Icon(Icons.favorite_border)),
                            ],
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Theme.of(context).colorScheme.surface,
                                   Theme.of(context).colorScheme.surface.withOpacity(0.54),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
