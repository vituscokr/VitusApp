import 'package:flutter/material.dart';
import 'package:vitus_app/ui/common/app_color.dart';
import 'package:vitus_app/ui/common/app_font.dart';
import 'package:vitus_app/ui/widget/no_glow_scroll_view.dart';
import 'package:vitus_app/utils/strings.dart';



class TestMainPage extends StatefulWidget {
  const TestMainPage({super.key});

  @override
  State<TestMainPage> createState() => _TestMainPageState();
}

class _TestMainPageState extends State<TestMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:
          Container(
            child: Text( getNumberFormat(100000000))
          )



        // Container(
        //   padding: const EdgeInsets.all(16),
        //   child: TextFormField(
        //     keyboardType:TextInputType.emailAddress,
        //     decoration: const InputDecoration(
        //       icon: Icon(Icons.person),
        //       hintText: "hint입니다.",
        //       labelText: "아이디",
        //       hintStyle: AppTextStyle.hintTextStyle,
        //     ),
        //     onSaved: (String? value) {
        //       print("onSaved");
        //
        //     },
        //     validator: (String? value) {
        //       return value != null && value.contains('@') ? 'Do not use the @char ' : null;
        //     },
        //   ),
        // ),
        
        // NoGlowScrollView(
        //   child: ListView.builder(
        //     itemCount: 100,
        //       itemBuilder: (context, index) {
        //       return Container(height: 100 , child: Text('$index'),);
        //
        //   }),
        // )

      ),
    );
  }
}
