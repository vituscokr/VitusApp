import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_vitus/test_widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vitus_app/ui/page/login_page.dart';
import 'package:vitus_app/ui/test/test_main_page.dart';
import 'package:vitus_app/ui/test/test_app_font_size_page.dart';
import 'package:vitus_app/ui/test/test_app_font_weight_page.dart';

import 'dart:math' show cos, sqrt, asin;

import 'ui/page/map_view.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(child: MyApp(),
        supportedLocales: const [
          Locale('en',''),
          Locale('ko',''),
        ],
        fallbackLocale: const Locale('en',''),
        path: 'assets/translations',
        startLocale: const Locale('en',''),
        useFallbackTranslations: true,
    )

  );


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.,


        )
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Maps',

      home:

        LoginPage(),
      //TestAppFontSizePage(),
      //TestAppFontWeightPage(),
      //TestMainPage(),
      //TestWidget()
    );
  }
}

