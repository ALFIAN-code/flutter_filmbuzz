import 'package:filmbuzz/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
  surface: Color(0xff19181E),
  primary: Color(0xff36353D),
  secondary: Color(0xff2B9AEA),
  inversePrimary: Color(0xffE2E2E2),
));

// Color Theme.of(context).colorScheme.surface = const Color(0xff19181E);
// Color Theme.of(context).colorScheme.primary = const Color(0xff36353D);
// Color Theme.of(context).colorScheme.secondary = const Color(0xff2B9AEA);
// Color Theme.of(context).colorScheme.inversePrimary = const Color(0xffE2E2E2);

TextStyle textStyle9Semibold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 9.0,
    fontWeight: FontWeight.w600,
  ),
);

// TextStyle dengan font Poppins, ukuran 9, dan bold
TextStyle textStyle9Bold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 9.0,
    fontWeight: FontWeight.bold,
  ),
);

// TextStyle dengan font Poppins, ukuran 10, dan regular
TextStyle textStyle10Regular = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 10.0,
    fontWeight: FontWeight.normal,
  ),
);

// TextStyle dengan font Poppins, ukuran 10, dan semibold
TextStyle textStyle10Semibold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 10.0,
    fontWeight: FontWeight.w600,
  ),
);

// TextStyle dengan font Poppins, ukuran 10, dan bold
TextStyle textStyle10Bold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 10.0,
    fontWeight: FontWeight.bold,
  ),
);

// TextStyle dengan font Poppins, ukuran 12, dan regular
TextStyle textStyle12Regular = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
  ),
);

// TextStyle dengan font Poppins, ukuran 12, dan semibold
TextStyle textStyle12Semibold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
  ),
);

// TextStyle dengan font Poppins, ukuran 12, dan bold
TextStyle textStyle12Bold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
  ),
);

// TextStyle dengan font Poppins, ukuran 14, dan regular
TextStyle textStyle14Regular = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
  ),
);

// TextStyle dengan font Poppins, ukuran 14, dan semibold
TextStyle textStyle14Semibold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
  ),
);

// TextStyle dengan font Poppins, ukuran 14, dan bold
TextStyle textStyle14Bold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  ),
);

// TextStyle dengan font Poppins, ukuran 16, dan regular
TextStyle textStyle16Regular = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
  ),
);

// TextStyle dengan font Poppins, ukuran 16, dan semibold
TextStyle textStyle16Semibold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  ),
);

// TextStyle dengan font Poppins, ukuran 16, dan bold
TextStyle textStyle16Bold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  ),
);

// TextStyle dengan font Poppins, ukuran 18, dan regular
TextStyle textStyle18Regular = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
  ),
);

// TextStyle dengan font Poppins, ukuran 18, dan semibold
TextStyle textStyle18Semibold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  ),
);

// TextStyle dengan font Poppins, ukuran 18, dan bold
TextStyle textStyle18Bold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  ),
);

// TextStyle dengan font Poppins, ukuran 20, dan regular
TextStyle textStyle20Regular = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 20.0,
    fontWeight: FontWeight.normal,
  ),
);

// TextStyle dengan font Poppins, ukuran 20, dan semibold
TextStyle textStyle20Semibold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  ),
);

// TextStyle dengan font Poppins, ukuran 20, dan bold
TextStyle textStyle20Bold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  ),
);

// TextStyle dengan font Poppins, ukuran 22, dan regular
TextStyle textStyle22Regular = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 22.0,
    fontWeight: FontWeight.normal,
  ),
);

// TextStyle dengan font Poppins, ukuran 22, dan semibold
TextStyle textStyle22Semibold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
  ),
);

// TextStyle dengan font Poppins, ukuran 22, dan bold
TextStyle textStyle22Bold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  ),
);

// TextStyle dengan font Poppins, ukuran 24, dan regular
TextStyle textStyle24Regular = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
  ),
);

// TextStyle dengan font Poppins, ukuran 24, dan semibold
TextStyle textStyle24Semibold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
  ),
);

// TextStyle dengan font Poppins, ukuran 24, dan bold
TextStyle textStyle24Bold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  ),
);

// TextStyle dengan font Poppins, ukuran 26, dan regular
TextStyle textStyle26Regular = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 26.0,
    fontWeight: FontWeight.normal,
  ),
);

// TextStyle dengan font Poppins, ukuran 26, dan semibold
TextStyle textStyle26Semibold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 26.0,
    fontWeight: FontWeight.w600,
  ),
);

// TextStyle dengan font Poppins, ukuran 26, dan bold
TextStyle textStyle26Bold = GoogleFonts.poppins(
  textStyle: TextStyle(
    color: Theme.of(navigatorKey.currentState!.overlay!.context)
        .colorScheme
        .inversePrimary,
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
  ),
);
