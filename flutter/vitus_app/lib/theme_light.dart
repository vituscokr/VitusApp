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
        primary: LightThemeColor.primaryColor,
        onPrimary: LightThemeColor.onPrimaryColor,
        secondary: LightThemeColor.secondaryColor,
        error: LightThemeColor.errorColor,
        background: LightThemeColor.backgroundColor,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      filledButtonTheme: _buildFillButtonTheme(),
      outlinedButtonTheme: _buildOutlineButtonTheme(),
      textButtonTheme: _buildTextButtonTheme(),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
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
      titleLarge: base.titleLarge?.copyWith(
          fontSize: 24, color: Colors.green, fontWeight: AppFontWeight.bold),
      titleMedium: base.titleMedium?.copyWith(
          fontSize: 22, color: Colors.red, fontWeight: AppFontWeight.medium),
      titleSmall: base.titleSmall?.copyWith(
          fontSize: 20, color: Colors.blue, fontWeight: AppFontWeight.regular),
      bodyLarge: base.bodyLarge?.copyWith(fontSize: 18),
      bodyMedium: base.bodyMedium?.copyWith(fontSize: 16),
      bodySmall: base.bodySmall?.copyWith(fontSize: 14),
      labelLarge: base.labelLarge?.copyWith(fontSize: 12),
      labelMedium: base.labelMedium?.copyWith(fontSize: 10),
      labelSmall: base.labelSmall?.copyWith(fontSize: 8),
    );
  }

  static FilledButtonThemeData _buildFillButtonTheme() {
    return FilledButtonThemeData(
        style: ButtonStyle(
            //enableFeedback: false,
            backgroundColor: MaterialStateProperty.resolveWith((states)  {
              if(states.contains(MaterialState.disabled)) {
                return LightThemeColor.fillButtonDisableColor;
              }else if(states.contains(MaterialState.pressed)) {
                return LightThemeColor.fillButtonPressedColor;
              }
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states)  {
              if(states.contains(MaterialState.disabled)) {
                return LightThemeColor.fillButtonDisableTextColor;
              }
            }),
            maximumSize: MaterialStateProperty.all(
              const Size(double.infinity, 60)
            ),
            minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, 60),
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
              fontSize: AppFontSize.bodyMedium,
            )),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                //side: BorderSide(color: Colors.red)
              ),
            )));
  }

  static OutlinedButtonThemeData _buildOutlineButtonTheme() {
    return OutlinedButtonThemeData(
        style: ButtonStyle(
          //enableFeedback: false,
            maximumSize: MaterialStateProperty.all(
                const Size(double.infinity, 60)
            ),
            minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, 60),
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
              fontSize: AppFontSize.bodyMedium,
            )),
            // side: MaterialStateProperty.all(
            //
            // ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: LightThemeColor.primaryColor)
              ),
            )));
  }

  static TextButtonThemeData _buildTextButtonTheme() {
    return TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: AppFontSize.bodySmall,
          )
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.transparent
        ),
        foregroundColor:  MaterialStateProperty.all(
          LightThemeColor.textColor
        )
      )
    );
  }
}
