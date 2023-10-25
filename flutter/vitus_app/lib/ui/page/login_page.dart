import 'package:flutter/material.dart';
import 'package:vitus_app/ui/common/app_font.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
          color: Colors.red,
          child: SafeArea(
            child: Container(
              width: double.infinity,
              color: Colors.yellow,
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
                      // Image.asset("assets/image/logo.svg",
                      // width: 100,
                      // height: 100),

                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter some text";
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            _id = (value ?? "").trim();
                            checkForm();
                            print("id onSaved : $value");
                          },
                          decoration: InputDecoration(
                            // contentPadding: ,
                            isCollapsed: false,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'hint',
                            counterText: _id?.length.toString(),
                            errorStyle: const TextStyle(
                              height: 1.3,
                              fontSize: AppFontSize.bodyMedium,
                              color: Colors.green,
                              fontWeight: AppFontWeight.regular,
                            ),
                            hintStyle: const TextStyle(
                                fontSize: AppFontSize.bodyMedium,
                                color: Colors.blue,
                                fontWeight: AppFontWeight.regular),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                )),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                )),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                )),
                            prefixIcon: Icon(
                              Icons.account_box,
                              size: 28.0
                            ),
                            suffixIconConstraints: const BoxConstraints(),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {

                              },
                            )
                          )),

                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter some text";
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          print("password onSaved : $value");
                          _pass = (value ?? "").trim();
                          checkForm();
                        },
                      ),

                      ElevatedButton(
                          onPressed: () {}, child: const Text("Login"))
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
      _formKey.currentState!.save();
      isEnable = true;
    } else {
      isEnable = false;
    }
    setState(() {
      _isEnableConfirm = true;
    });
  }
}
