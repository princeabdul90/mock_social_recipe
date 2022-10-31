import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeTheme {
  static TextTheme lightThemeText = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    )
  );
  static TextTheme darkThemeText = TextTheme(
      bodyText1: GoogleFonts.openSans(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline1: GoogleFonts.openSans(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline2: GoogleFonts.openSans(
        fontSize: 21,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline3: GoogleFonts.openSans(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
      ),
      headline6: GoogleFonts.openSans(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: lightThemeText,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) => Colors.black),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      )
    );
  }
  static ThemeData dark() {
    return ThemeData(
        brightness: Brightness.dark,
        textTheme: darkThemeText,
        appBarTheme:  AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[900],
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.green,
        )
    );
  }
}