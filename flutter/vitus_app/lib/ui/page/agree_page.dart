import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vitus_app/ui/common/app_color.dart';
import 'package:vitus_app/ui/common/app_font.dart';

class AgreePage extends StatefulWidget {
  const AgreePage({super.key});

  @override
  State<AgreePage> createState() => _AgreePageState();
}

class _AgreePageState extends State<AgreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(
        //   color : LightThemeColor.textColor
        // ),
        elevation: 0.0,
        titleSpacing: 0.0,
        leadingWidth: 44.0,
        toolbarHeight: 64,
          backgroundColor: Colors.white,
          leading:
              IconButton(onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios , color:LightThemeColor.textColor ),),
          // IconButton(onPressed: () {
          //   Navigator.of(context).pop();
          // }, icon: const Icon(Icons.arrow_back_ios), style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all(
          //     LightThemeColor.textColor
          //   ),
          //   foregroundColor: MaterialStateProperty.all(
          //     LightThemeColor.textColor
          //   )
          // ),),
          title: Text("join".tr()),
        titleTextStyle: TextStyle(
          color: LightThemeColor.textColor,
          fontSize: AppFontSize.titleSmall,
          fontWeight: AppFontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Container(

        ),
      )
    );
  }
}
