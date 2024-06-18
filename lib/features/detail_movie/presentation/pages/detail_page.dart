// import 'package:filmbuzz/features/detail_movie/presentation/get/detail_movie.dart';
import 'package:filmbuzz/features/detail_movie/presentation/bloc/detail_movie.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Center(
        child: Text('$movieID'),
      )),
    );
  }
}
