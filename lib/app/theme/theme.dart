import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:myapp_2/app/utils/color_consts.dart';

class AppThemes {
  static ThemeData blueTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: blueThemeColor,
    ),
    textTheme: GoogleFonts.ubuntuTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shadowColor: blueThemeColor,
        backgroundColor: blueThemeContainer,
      ),
    ),
    cardTheme: const CardTheme(
      color: blueThemeContainer,
      elevation: 10.0,
    ),
  );

  static ThemeData orangeTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: orangeThemeColor,
    ),
    textTheme: GoogleFonts.ubuntuTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shadowColor: orangeThemeColor,
        backgroundColor: orangeThemeContainer,
      ),
    ),
    cardTheme: const CardTheme(
      color: orangeThemeContainer,
      elevation: 3.0,
    ),
  );

  static ThemeData cyanTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: cyanThemeColor,
    ),
    textTheme: GoogleFonts.ubuntuTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shadowColor: cyanThemeColor,
        backgroundColor: cyanThemeContainer,
      ),
    ),
    cardTheme: const CardTheme(
      color: cyanThemeContainer,
      elevation: 3.0,
    ),
  );
}
