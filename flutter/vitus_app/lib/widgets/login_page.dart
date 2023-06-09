import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:vitus_app/enums/login_platform.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPlatform _loginPlatform = LoginPlatform.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ),
      )
    );
  }
  Widget _buildBody() {

    if(_loginPlatform == LoginPlatform.none) {
      return Column(
        children: <Widget>[

          _loginButton("logo_google", () async {
            final GoogleSignInAccount? googleUser = await GoogleSignIn()
                .signIn();
            if (googleUser != null) {
              print('name = ${googleUser.displayName}');
              print('email = ${googleUser.email}');
              print('id = ${googleUser.id}');
              setState(() {
                _loginPlatform = LoginPlatform.google;
              });
            }
          }),
          _loginButton("logo_naver", () async{
            final NaverLoginResult result = await FlutterNaverLogin.logIn();
            if (result.status == NaverLoginStatus.loggedIn) {
              print('accessToken = ${result.accessToken}');
              print('id = ${result.account.id}');
              print('email = ${result.account.email}');
              print('name = ${result.account.name}');

              setState(() {
                _loginPlatform = LoginPlatform.naver;
              });
            }

          }),
          _loginButton("logo_apple", () async {
            try {
              final scopes = <AppleIDAuthorizationScopes>[
                AppleIDAuthorizationScopes.email,
                AppleIDAuthorizationScopes.fullName
              ];
              final AuthorizationCredentialAppleID credential = await SignInWithApple
                  .getAppleIDCredential(scopes: scopes,
                  webAuthenticationOptions: WebAuthenticationOptions(
                      clientId: "app.vitus.co.kr",
                      redirectUri: Uri.parse(
                          "https://apricot-cactus-trader.glitch.me/callbacks/sign_in_with_apple")));
              print('credential.state = $credential');
              print('credential.state = ${credential.email}');
              print('credential.state = ${credential.userIdentifier}');
              print('credential.fullname = ${credential.givenName}');
              print('credential.fullname = ${credential.familyName}');

              setState(() {
                _loginPlatform = LoginPlatform.apple;
              });

            }catch (error) {
              print("error = $error");
            }

          }),
          _loginButton("logo_kakao", signInWithKakao)


        ],
      );
    }else {
      return Column(
        children: <Widget>[
          Text("login :$_loginPlatform"),
          InkWell(
            onTap: () {
              singOut();
            },
            child: Text("LOGOUT")
          )
        ],
      );
    }
  }

  Future<void> signIn() async {

  }

  Widget _loginButton(String imagename, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 18.0,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: Ink.image(image: AssetImage('assets/images/$imagename.png'),
        width: 60,
        height:60,),

      ),
    );
  }

  void signInWithKakao() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();

      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      final url = Uri.https('kapi.kakao.com', '/v2/user/me');

      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
        },
      );

      final profileInfo = json.decode(response.body);
      print(profileInfo.toString());

      setState(() {
        _loginPlatform = LoginPlatform.kakao;
      });

    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }
  }

  void singOut() async {
    switch(_loginPlatform) {
      case LoginPlatform.kakao:
        await UserApi.instance.logout();
        break;
      case LoginPlatform.google:
        await GoogleSignIn().signOut();
       // _googleSignIn.disconnect();
        break;
      case LoginPlatform.naver:
        await FlutterNaverLogin.logOut();
        break;
      case LoginPlatform.apple:
        break;
      case LoginPlatform.none:
        break;
    }
    setState(() {
      _loginPlatform = LoginPlatform.none;
    });
  }
}
