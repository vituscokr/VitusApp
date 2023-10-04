import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vitus_app/ui/test/test_main_page.dart';
import 'package:vitus_app/ui/test/test_app_font_size_page.dart';
import 'package:vitus_app/ui/test/test_app_font_weight_page.dart';

import 'dart:math' show cos, sqrt, asin;

import 'ui/page/map_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:

      //TestAppFontSizePage(),
      //TestAppFontWeightPage(),
      TestMainPage(),
    );
  }
}

