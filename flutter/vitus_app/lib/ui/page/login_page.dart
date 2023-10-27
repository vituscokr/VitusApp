import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vitus_app/ui/common/app_font.dart';
import 'package:vitus_app/ui/widget/textfield_widget.dart';
import 'package:vitus_app/utils/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _id;
  String? _pass;
  bool _isEnableConfirm = false;

  late TextEditingController _idController;
  late TextEditingController _passController;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  void dispose() {
    _idController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
          //color: Colors.red,
          child: SafeArea(
            child: Container(
              width: double.infinity,
              // color: Colors.yellow,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FocusTraversalGroup(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  onChanged: () {
                    Form.of(primaryFocus!.context!).save();
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      // Image.asset("assets/image/logo.svg",
                      // width: 100,
                      // height: 100),

                      AppTextfield(
                        controller: _idController,
                        hintText: "id".tr(),
                        validator: (value) {
                          return Validator.id(value);
                        },
                        onChange: (value) {
                          _id = value?.trim();
                          checkForm();
                        },
                      ),

                      const SizedBox(height: 16),
                      AppTextfield(
                        controller: _passController,
                        validator: (value) {
                          return Validator.pass(value);
                        },
                        onChange: (value) {
                          _pass = value?.trim();
                          checkForm();
                        },
                        obscureText: true,
                        hintText: "pass".tr(),
                      ),
                      const SizedBox(height: 16),

                      IntrinsicHeight(
                        child: Row(
                          children: [
                            TextButton(onPressed: findId, child: Text("find_id".tr())),
                            const VerticalDivider(width: 1, thickness: 1, indent:15, endIndent: 15,),
                            TextButton(onPressed: findPass, child: Text("find_pass".tr()))

                        ]),
                      ),
                      const SizedBox(height: 16),

                      FilledButton(
                          onPressed: _isEnableConfirm ? login : null,
                          child: Text("login".tr())),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: OutlinedButton(
                          onPressed: join,
                          child: Text("join".tr()),
                        ),
                      )
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: ElevatedButton(
                      //       onPressed: () {}, child: Text("login".tr())),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void checkForm() {
    bool isEnable = false;
    if (_formKey.currentState!.validate()) {
      // 입력된 값들을 모두 저장
      // _formKey.currentState!.save();
      isEnable = true;
    } else {
      isEnable = false;
    }
    setState(() {
      _isEnableConfirm = isEnable;
    });
  }

  void login() {

  }

  void join() {

  }

  void findId() {
    print("아이디 찾기");
  }

  void findPass() {
    print("비밀번호 찾기");
  }
}
