// import 'package:filmbuzz/public/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../style.dart';

class SearchCustom extends StatelessWidget {
  const SearchCustom({super.key, this.autoFocus = false});
  final bool autoFocus;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 47,
            width: 290,
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20)),
            child: TextField(
              autofocus: autoFocus,
              style: textStyle12Regular,
              textAlignVertical: TextAlignVertical.top,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Something",
                  hintStyle: textStyle12Regular.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .inversePrimary
                          .withOpacity(0.5))),
            ),
          ),
          Container(
            height: 47,
            width: 47,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SvgPicture.asset(
              'lib/assets/icons/Search 2.svg',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
