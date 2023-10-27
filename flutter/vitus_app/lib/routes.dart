import 'package:flutter/cupertino.dart';
import 'package:vitus_app/ui/page/agree_page.dart';
import 'package:vitus_app/ui/page/join_page.dart';
import 'package:vitus_app/ui/page/login_page.dart';

class Routes {
  Routes._();

  static const String loginPage = "/login";
  static const String agreePage = "/agree";
  static const String joinPage = "/join";

  static final routes = <String, WidgetBuilder>{
    loginPage: (BuildContext context) => const LoginPage(),
    agreePage : (BuildContext context) => const AgreePage(),
    joinPage : (BuildContext context) => const JoinPage(),

  };
}