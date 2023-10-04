import 'package:flutter/cupertino.dart';
// ignore: non_constant_identifier_names
// 참고 : https://changjoopark.medium.com/flutter-%EC%8A%A4%ED%81%AC%EB%A1%A4-%ED%9A%A8%EA%B3%BC%EB%A5%BC-%EC%97%86%EC%95%A0%EB%8A%94-%EB%B0%A9%EB%B2%95-ad196b7e7552
Widget NoGlowScrollView({required Widget child}) {
  return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: child);
}
