import 'package:flutter/material.dart';

import '../common/app_font.dart';

class TestAppFontSizePage extends StatefulWidget {
  const TestAppFontSizePage({super.key});

  @override
  State<TestAppFontSizePage> createState() => _TestAppFontSizePageState();
}

class _TestAppFontSizePageState extends State<TestAppFontSizePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: List.generate(13, (index) {
            var fontSize;
            switch(index) {
              case 0: fontSize = AppFontSize.displayLarge; break;
              case 1: fontSize = AppFontSize.displayMedium; break;
              case 2: fontSize = AppFontSize.displaySmall; break;
              case 3: fontSize = AppFontSize.headlineMedium; break;
              case 4: fontSize = AppFontSize.headlineSmall; break;
              case 5: fontSize = AppFontSize.titleLarge; break;
              case 6: fontSize = AppFontSize.titleMedium; break;
              case 7: fontSize = AppFontSize.titleSmall; break;
              case 8: fontSize = AppFontSize.bodyLarge; break;
              case 9: fontSize = AppFontSize.bodyMedium; break;
              case 10: fontSize = AppFontSize.bodySmall; break;
              case 11: fontSize = AppFontSize.labelLarge; break;
              case 12: fontSize = AppFontSize.labelSmall; break;
            }

            return Text("이것은 테스트입니다.",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:  TextStyle(
                                  fontSize: fontSize,
                                  height: 1.0 ,
                                  fontFamily: AppFont.defaultFont,
                                  fontWeight: AppFontWeight.regular,
                                  color: Colors.black,
                                )
                              );

          }),
        ),
      )
    );
  }
}
