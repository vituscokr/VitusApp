import 'package:flutter/material.dart';
import 'package:vitus_app/ui/common/app_color.dart';

class AppFont {
  static const String defaultFont = "";
}

class AppFontSize {
  static const double  displayLarge = 32;
  static const double  displayMedium = 30;
  static const double  displaySmall = 28;
  static const double  headlineMedium = 26;
  static const double  headlineSmall = 24;
  static const double  titleLarge = 22;
  static const double  titleMedium = 20;
  static const double  titleSmall = 18;
  static const double  bodyLarge = 16;
  static const double  bodyMedium = 14;
  static const double  bodySmall = 12;
  static const double  labelLarge = 10;
  static const double  labelSmall = 8;
}

class AppFontWeight {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight thick = FontWeight.w900;
}


class AppTextStyle {

  static const TextStyle hintTextStyle = TextStyle(
    fontSize: AppFontSize.bodyMedium,
    color: AppColor.hintColor,
    fontFamily: AppFont.defaultFont,
    fontWeight: AppFontWeight.regular,
  );
}
