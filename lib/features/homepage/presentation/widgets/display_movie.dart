// import 'package:flutter/material.dart';

// import '../../../../public/model/movie_model.dart';

// class DisplayMovie extends StatelessWidget {
//   DisplayMovie({super.key, required this.items});

//   List<ListMovie> items = [];

//   @override
//   Widget build(BuildContext context) {
//     // return GridView.builder(
//     //   padding: EdgeInsets.zero,
//     //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     //     childAspectRatio: 1.0,
//     //     crossAxisCount: 2,
//     //     mainAxisSpacing: 6,
//     //     crossAxisSpacing: 6,
//     //   ),
//     //   itemCount: 6,
//     //   shrinkWrap: true,
//     //   physics: const ScrollPhysics(),
//     //   itemBuilder: (BuildContext context, int index) {
//     //     return Container(
//     //       color: Colors.purple,
//     //       child: const Column(
//     //         children: [],
//     //       ),
//     //     );
//     //   },
//     // );

//     return GridView(

//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 3.1,
//           mainAxisExtent: 10,
//           crossAxisSpacing: 10),
//       children:items. ,
//     );
//   }
// }
