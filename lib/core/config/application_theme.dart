import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static Color primaryColor = const Color(0xFF004182);
  static ThemeData appTheme = ThemeData(
    primaryColor: primaryColor,
    textTheme:  TextTheme(
      titleLarge: const TextStyle(
        fontFamily: "Poppines",
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontFamily: "Poppines",
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      bodyLarge: const TextStyle(
        fontFamily: "Poppines",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyMedium: const TextStyle(
        fontFamily: "Poppines",
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodySmall: const TextStyle(
        fontFamily: "Poppines",
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    )
  );
}
