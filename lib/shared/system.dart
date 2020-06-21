import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setSystemBarStyle({ bool isDark = true }) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
    statusBarIconBrightness: isDark ? Brightness.dark : Brightness.light,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark
  ));
}