import 'package:flutter/material.dart';

class ModeTheme {
  static final light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 120, 140, 160),
    ),
    // colorSchemeSeed: const Color(0xfff1f2f3),
  );
  static final dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff17171c),
      brightness: Brightness.dark,
    ),
  );
}
