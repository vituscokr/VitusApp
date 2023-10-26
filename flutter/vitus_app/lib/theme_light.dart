import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitus_app/ui/common/app_color.dart';
import 'package:vitus_app/ui/common/app_font.dart';

class LightThemeData {



  static ThemeData lightThemeData = themeData();

  static ThemeData themeData() {
    final base = ThemeData.light();

    return base.copyWith(
      colorScheme: const ColorScheme.light().copyWith(
        primary :  LightThemeColor.primaryColor,
        secondary: LightThemeColor.secondaryColor,
        error: LightThemeColor.errorColor,
        background: LightThemeColor.backgroundColor,
      ),
      textTheme: _buildTextTheme(base.textTheme),







    );
  }
  static TextTheme _buildTextTheme(TextTheme base) {
      // GoogleFonts.nanumGothic(textStyle: base.bodyMedium),
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(fontSize: 36),
      displayMedium: base.displayMedium?.copyWith(fontSize: 34),
      displaySmall: base.displaySmall?.copyWith(fontSize: 32),
      headlineLarge: base.headlineLarge?.copyWith(fontSize: 30),
      headlineMedium: base.headlineMedium?.copyWith(fontSize: 28),
      headlineSmall: base.headlineSmall?.copyWith(fontSize: 26),
      titleLarge:  base.titleLarge?.copyWith(fontSize: 24, color: Colors.green, fontWeight: AppFontWeight.bold),
      titleMedium: base.titleMedium?.copyWith(fontSize: 22 , color: Colors.red , fontWeight: AppFontWeight.medium),
      titleSmall: base.titleSmall?.copyWith(fontSize: 20 , color:Colors.blue, fontWeight: AppFontWeight.regular),
      bodyLarge: base.bodyLarge?.copyWith(fontSize: 18),
      bodyMedium:base.bodyMedium?.copyWith(fontSize: 16),
      bodySmall: base.bodySmall?.copyWith(fontSize: 14),
      labelLarge: base.labelLarge?.copyWith(fontSize: 12),
      labelMedium: base.labelSmall?.copyWith(fontSize: 10),
      labelSmall: base.labelSmall?.copyWith(fontSize: 8),
    );
  }
}