import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setSystemBarStyle({ bool isDark = true }) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: isDark ? Brightness.light : Brightness.dark,
    statusBarIconBrightness: isDark ? Brightness.dark : Brightness.light,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark
  ));
}

void setSystemOrientation({ bool landscape = false }) {
  SystemChrome.setPreferredOrientations(
    landscape ? [
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
    ] : [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]
  );
}