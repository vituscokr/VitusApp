import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:vitus_app/enums/LoginPlatform.dart';


const String naverLoginClientId = "T9uDAmPdfRnpjDmJucB_";
const String naverLoginClientScret = "e8MZR8EZyM";
const List<String> googleScopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly'
];
GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: googleScopes,
);

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPlatform _loginPlatform = LoginPlatform.none;

  GoogleSignInAccount? _currentUser;
  bool _isAuthorized = false;
  String _contactText = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged
    .listen((GoogleSignInAccount? account) async {
      print("onCurrentUserChanged");
      bool isAuthorized = account != null;
      if(kIsWeb && account != null) {
        isAuthorized = await _googleSignIn.canAccessScopes(googleScopes);
      }
      print(account);

      setState(() {
        _currentUser = account;
        _isAuthorized = isAuthorized;
      });
      if(isAuthorized) {
        unawaited(_handleGetContact(account!));
      }

    });
    _googleSignIn.signInSilently();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: _buildBody(),
      )
    );
  }

  Widget _buildBody() {
    final GoogleSignInAccount? user = _currentUser;

    if(user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: user,
            ),
            title: Text(user.displayName ?? ''),
            subtitle: Text(user.email),
          ),
          const Text('Signed in successfully.'),
          if(_isAuthorized) ...<Widget>[
            Text(_contactText),
            ElevatedButton(
                onPressed: () => _handleGetContact(user),
                child: const Text('REFRESH')
            ),
          ],
          if(!_isAuthorized) ...<Widget>[
            const Text('Additional permissions needed to read your contacts.'),
            ElevatedButton(
              onPressed: _handleAuthorizeScopes,
              child: const Text('REQUEST PERMISSIONS'),
            ),
          ]
        ],
      );
    }else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          const Text("You are not currently signed in"),
          InkWell(
            onTap: () async {
              final NaverLoginResult result = await FlutterNaverLogin.logIn();
              if(result.status == NaverLoginStatus.loggedIn) {
                print('accessToken = ${result.accessToken}');
                print('id = ${result.account.id}');
                print('email = ${result.account.email}');
                print('name = ${result.account.name}');

                setState(() {
                  _loginPlatform = LoginPlatform.naver;
                });
              }

            },
            child: const Text("naver login"),
          ),
          InkWell(
            onTap: () async {
              try {
                bool isInstalled = await isKakaoTalkInstalled();
                OAuthToken token = isInstalled
                    ? await UserApi.instance.loginWithKakaoTalk()
                    : await UserApi.instance.loginWithKakaoAccount() ;

                final url = Uri.https('kapi.kakao.com', '/v2/user/me');
                final response = await http.get(url, headers: {HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'},);
                final profileInfo = json.decode(response.body);
                print(profileInfo.toString());

                setState(() {
                _loginPlatform = LoginPlatform.kakao;
                });
            } catch (error) {
            print('카카오톡으로 로그인 실패 $error');
            }

            },
            child: const Text("kakao login")
          ),
          InkWell(
            onTap: _handleSignIn,
            child: const Text("Google SignIn"),
          )
        ],
      );
    }
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {

  }
  Future<void> _handleAuthorizeScopes() async {

  }

  Future<void> _handleSignIn() async {
    print("abc");
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      print(googleUser);
    }catch(error) {
      print(error);
    }
  }




  void signOut() async {
    switch(_loginPlatform) {
      case LoginPlatform.kakao:
        await UserApi.instance.logout();
        break;
      case LoginPlatform.google:
        _googleSignIn.disconnect();
        break;
      case LoginPlatform.naver:
        await FlutterNaverLogin.logOut();
        break;
      case LoginPlatform.none:
        break;
    }
    setState(() {
      _loginPlatform = LoginPlatform.none;
    });
  }
}
