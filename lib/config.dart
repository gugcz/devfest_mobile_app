import 'package:flutter/material.dart';

class Config {

  static const int _blackPrimaryValue = 0xFF1E3247;

  static const MaterialColor colorPalette = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFFE4E6E9),
      100: Color(0xFFBCC2C8),
      200: Color(0xFF8F99A3),
      300: Color(0xFF62707E),
      400: Color(0xFF405163),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF1A2D40),
      700: Color(0xFF162637),
      800: Color(0xFF121F2F),
      900: Color(0xFF0A1320),
    },
  );
}