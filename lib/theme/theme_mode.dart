import 'package:flutter/material.dart';

class ModeTheme {
  static final light = ThemeData(
    fontFamily: "WorkSans",
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 102, 124, 146),
    ),
    // colorSchemeSeed: const Color(0xfff1f2f3),
  );

  static final dark = ThemeData(
    fontFamily: "WorkSans",
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 0, 0, 0),
      brightness: Brightness.dark,
    ),
  );
}
