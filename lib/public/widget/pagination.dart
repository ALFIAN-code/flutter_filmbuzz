import 'package:filmbuzz/public/style.dart';
import 'package:flutter/material.dart';

class CustomPagination extends StatelessWidget {
  CustomPagination({
    super.key,
    required this.onNext,
    required this.onPrev,
    required this.totalpage,
    required this.currentPage,
  });
  final void Function()? onPrev;
  final void Function()? onNext;
  final int totalpage;
  int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (currentPage == 1)
            ? IconButton(
                onPressed: null,
                icon: Icon(
                  size: 16,
                  Icons.arrow_back_ios,
                  color: Theme.of(context)
                      .colorScheme
                      .inversePrimary
                      .withOpacity(0.7),
                ))
            : IconButton(
                onPressed: onPrev,
                icon: Icon(
                  size: 16,
                  Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.secondary,
                )),
        Expanded(
            child: Center(
                child: Text(
          'page $currentPage of $totalpage',
          style: textStyle12Regular,
        ))),
        (currentPage == totalpage)
            ? IconButton(
                onPressed: null,
                icon: Icon(
                  size: 16,
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context)
                      .colorScheme
                      .inversePrimary
                      .withOpacity(0.7),
                ))
            : IconButton(
                onPressed: onNext,
                icon: Icon(
                  size: 16,
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).colorScheme.secondary,
                )),
      ],
    );
  }
}
