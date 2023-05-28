import 'package:flutter/material.dart';

class AppColors {
  static const int _primary = 0xFF92B954;
  static MaterialColor mainColor = const MaterialColor(
    _primary,
    <int, Color>{
      50: Color(0xFFC2E092),
      100: Color(0xFFB8D984),
      200: Color(0xFFADCF76),
      300: Color(0xFFA4C76B),
      400: Color(0xFFA4C76B),
      500: Color(_primary),
      600: Color(0xFF87B046),
      700: Color(0xFF87B046),
      800: Color(0xFF80A840),
      900: Color(0xFF80A840),
    },
  );
  static Color white = Colors.white;
  static Color red = Colors.red;
  static Color grey = Colors.grey;
}
