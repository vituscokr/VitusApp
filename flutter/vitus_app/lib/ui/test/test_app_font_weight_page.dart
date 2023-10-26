import 'package:flutter/material.dart';
import 'package:vitus_app/ui/common/app_color.dart';
import 'package:vitus_app/ui/common/app_font.dart';

class TestAppFontWeightPage extends StatefulWidget {
  const TestAppFontWeightPage({super.key});

  @override
  State<TestAppFontWeightPage> createState() => _TestAppFontWeightPageState();
}

class _TestAppFontWeightPageState extends State<TestAppFontWeightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: List.generate(9, (index)  {

            FontWeight weight;

            switch(index) {
              case 0: weight = AppFontWeight.thin; break;
              case 1: weight = AppFontWeight.extraLight; break;
              case 2: weight = AppFontWeight.light; break;
              case 3: weight = AppFontWeight.regular; break;
              case 4: weight = AppFontWeight.medium; break;
              case 5: weight = AppFontWeight.semiBold; break;
              case 6: weight = AppFontWeight.bold; break;
              case 7: weight = AppFontWeight.extraBold; break;
              case 8: weight = AppFontWeight.thick; break;
              default:
                weight = AppFontWeight.regular;
                break;

            }

            return Text("This is Test! 이것은 테스트입니다.",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: AppFontSize.bodyMedium,
                  height: 1.0 ,
                  fontFamily: AppFont.defaultFont,
                  fontWeight: weight,
                  color: LightThemeColor.defaultColor,
                )
            );
          },),
        ),
      ),
    );
  }
}
