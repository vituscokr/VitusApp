import 'package:flutter/material.dart';
import 'package:vitus_app/ui/widget/textfield_widget.dart';

class TestTextFieldPage extends StatefulWidget {
  const TestTextFieldPage({super.key});

  @override
  State<TestTextFieldPage> createState() => _TestTextFieldPageState();
}

class _TestTextFieldPageState extends State<TestTextFieldPage> {

  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          children: [
            AppTextfield(
              controller: _controller,
                validator: (value) {
              return null;
            },
              obscureText: true,
              hintText: "입력칸 테스트 하세요.",
              enabled:  true,
            )
          ],
        ),
      )
    );
  }
}
