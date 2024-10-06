import 'package:flutter/material.dart';

class ModeTheme {
  static final light = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: const Color(0xfff1f2f3),
  );
  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: const Color.fromRGBO(86, 80, 14, 171),
  );
}
