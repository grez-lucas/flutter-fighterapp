

import 'package:flutter/material.dart' ;

class AppTheme {


  static const String fontName = 'Poppins';

  static const Color primaryColor = Color.fromARGB(255, 219, 218, 168);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.light,
    fontFamily: fontName,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      foregroundColor: Colors.white,
    ),
  );
}