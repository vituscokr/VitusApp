import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkThemeData {

  static Color primaryColor = Color(0xffA0DFFF);
  static Color secondaryColor = Color(0xff480032);
  static Color accentColor = Color(0xffFFD2BB);

  static ThemeData lightThemeData = themeData();

  static ThemeData themeData() {
    final base = ThemeData.light();

    return base.copyWith(
      colorScheme: const ColorScheme.light().copyWith(
          primary :  DarkThemeData.primaryColor,
          secondary: DarkThemeData.secondaryColor
      ),
      textTheme: _buildAppTextTheme(base.textTheme),

    );
  }
  static TextTheme _buildAppTextTheme(TextTheme base) {

    return base.copyWith(
        titleLarge: GoogleFonts.robotoSlab(textStyle: base.titleLarge),
        bodyMedium: GoogleFonts.nanumGothic(textStyle: base.bodyMedium)
    );
  }
}