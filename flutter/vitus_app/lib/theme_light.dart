import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightThemeData {

  static Color primaryColor = Color(0xffdf0054);
  static Color secondaryColor = Color(0xff480032);
  static Color accentColor = Color(0xffFFD2BB);

  static ThemeData lightThemeData = themeData();

  static ThemeData themeData() {
    final base = ThemeData.light();

    return base.copyWith(
      colorScheme: const ColorScheme.light().copyWith(
        primary :  LightThemeData.primaryColor,
        secondary: LightThemeData.secondaryColor
      ),
        textTheme: _buildAppTextTheme(base.textTheme),

    );
  }
  static TextTheme _buildAppTextTheme(TextTheme base) {
      // GoogleFonts.nanumGothic(textStyle: base.bodyMedium),
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(fontSize: 36),
      displayMedium: base.displayMedium?.copyWith(fontSize: 34),
      displaySmall: base.displaySmall?.copyWith(fontSize: 32),
      headlineLarge: base.headlineLarge?.copyWith(fontSize: 30),
      headlineMedium: base.headlineMedium?.copyWith(fontSize: 28),
      headlineSmall: base.headlineSmall?.copyWith(fontSize: 26),
      titleLarge:  base.titleLarge?.copyWith(fontSize: 24),
      titleMedium: base.titleMedium?.copyWith(fontSize: 22),
      titleSmall: base.titleSmall?.copyWith(fontSize: 20),
      bodyLarge: base.bodyLarge?.copyWith(fontSize: 18),
      bodyMedium:base.bodyMedium?.copyWith(fontSize: 16),
      bodySmall: base.bodySmall?.copyWith(fontSize: 14),
      labelLarge: base.labelLarge?.copyWith(fontSize: 12),
      labelMedium: base.labelSmall?.copyWith(fontSize: 10),
      labelSmall: base.labelSmall?.copyWith(fontSize: 8),
    );
  }
}