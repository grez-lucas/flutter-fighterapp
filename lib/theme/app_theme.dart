import 'package:flutter/material.dart';

class AppTheme {
  static const String fontName = 'Poppins';

  static const Color primaryColor =
      Color.fromARGB(255, 139, 69, 19) // Earthy Brown
// Eldritch Blue
      // Dark Enchantment
      // Mystical Indigo
      ;

  static const Color secondaryColor =
      Color.fromARGB(255, 224, 224, 126); // Black

  static const Color backgroundColor =
      Color.fromARGB(255, 128, 128, 128); // Mystical Gray

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme:
        const ColorScheme.light(background: Color.fromARGB(255, 206, 170, 168)),
    brightness: Brightness.light,
    fontFamily: fontName,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
    ),
    scaffoldBackgroundColor: backgroundColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
      ),
    ),

    // Input Decoration

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      
    ),
  );
}
