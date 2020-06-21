import 'package:flutter/material.dart';
import 'package:integral_nutry/shared/widgets/label.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // This is the theme of your application.
      theme: ThemeData(
        primarySwatch: Colors.grey,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Label("Hello World!"),
            Label.rich(
              TextSpan(
                text: "Hello",
                children: <InlineSpan>[
                  TextSpan(text: " World", style: TextStyle( fontWeight: FontWeight.bold ))
                ]
              )
            ),
          ],
        )
      ),
    );
  }
}