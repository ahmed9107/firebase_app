import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    backgroundColor: const Color(0xFFf8f8f8),
    primaryColor: const Color(0xFFEA5165),
    shadowColor: const Color(0xFFe3e3e3),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    primaryColorLight: Colors.black,
  );
  static final dark = ThemeData(
    backgroundColor: const Color(0xFF303030),
    primaryColor: const Color(0xFFEA5165),
    shadowColor: const Color(0xFF212121),
    scaffoldBackgroundColor: const Color(0xFF424242),
    primaryColorLight: Colors.white,
  );
}
