import 'package:flutter/material.dart';
import 'package:integral_nutry/screens/access/access_widget.dart';
import 'package:integral_nutry/shared/system.dart';

class Access extends StatefulWidget {

  /// Route name
  static final String route = "/access";

  // Constrcutor
  Access() {
    // Config screen orientation
    setSystemOrientation();
  }

  @override
  /// Creating state
  State<StatefulWidget> createState() {
    return AccessScreen();
  }
}