import 'package:flutter/material.dart';
import 'package:integral_nutry/screens/init.dart';
import 'package:integral_nutry/shared/system.dart';

void main() {
  // Config standart style from device
  setSystemBarStyle();
  // Start application
  runApp(Application());
}

class Application extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialApp(
        title: 'Integral Nutry',

        // This is the theme of your application.
        theme: ThemeData(
          primarySwatch: Colors.grey,
          // Defines the visual density of user interface components.
          // Density, in the context of a UI, is the vertical and horizontal "compactness" 
          // of the components in the UI. It is unitless, since it means different things to different UI components.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        // Screen initial
        initialRoute: Access.route,

        // Screens map (routes)
        routes: {
          Access.route: (BuildContext context) => Access()
        },
      ),
    );
  }
}