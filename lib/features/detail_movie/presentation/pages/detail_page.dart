// import 'package:filmbuzz/features/detail_movie/presentation/get/detail_movie.dart';
import 'package:filmbuzz/features/detail_movie/presentation/getx/detail_movie.dart';
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
    return Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => (detailController.movieDetailsData.value.title == null)
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$movieID'),
                      Text('${detailController.movieDetailsData.value.title}'),
                    ],
                  ),
                ),
        ));
  }
}
