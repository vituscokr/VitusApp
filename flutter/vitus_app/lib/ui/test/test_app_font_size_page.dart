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
          children: List.generate(15, (index) {
            var style;
           String fontStyleName = "";

            switch(index) {
              case 0:
                fontStyleName = "displayLarge";
                style = Theme.of(context).textTheme.displayLarge;
                break;
              case 1:
                fontStyleName = "displayMedium";
                style = Theme.of(context).textTheme.displayMedium;
                break;
              case 2:
                fontStyleName = "displaySmall";
                style = Theme.of(context).textTheme.displaySmall;
                break;
              case 3:
                fontStyleName = "headlineLarge";
                style = Theme.of(context).textTheme.headlineLarge;
                break;
              case 4:
                fontStyleName = "headlineMedium";
                style = Theme.of(context).textTheme.headlineMedium;
                break;
              case 5:
                fontStyleName = "headlineSmall";
                style = Theme.of(context).textTheme.headlineSmall;
                break;
              case 6:
                fontStyleName = "titleLarge";
                style = Theme.of(context).textTheme.titleLarge;
                break;
              case 7:
                fontStyleName = "titleMedium";
                style = Theme.of(context).textTheme.titleMedium;
                break;
              case 8:
                fontStyleName = "titleSmall";
                style = Theme.of(context).textTheme.titleSmall;
                break;
              case 9:
                fontStyleName = "bodyLarge";
                style = Theme.of(context).textTheme.bodyLarge;
                break;
              case 10:
                fontStyleName = "bodyMedium";
                style = Theme.of(context).textTheme.bodyMedium;
                break;
              case 11:
                fontStyleName = "bodySmall";
                style = Theme.of(context).textTheme.bodySmall;
                break;
              case 12:
                fontStyleName = "labelLarge";
                style = Theme.of(context).textTheme.labelLarge;
                break;
              case 13:
                fontStyleName = "labelMedium";
                style = Theme.of(context).textTheme.labelMedium;
                break;
              case 14:
                fontStyleName = "labelSmall";
                style = Theme.of(context).textTheme.labelSmall;
                break;
            }

            return Column(
              children: [
                Text(fontStyleName, style: TextStyle(fontSize: 10),),
                Text("이것은 테스트입니다.",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:  style
                                  ),
              ],
            );

          }),
        ),
      )
    );
  }
}
