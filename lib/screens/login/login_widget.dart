import 'package:flutter/material.dart';
import 'package:integral_nutry/screens/init.dart';
import 'package:integral_nutry/shared/widgets/label.dart';

class LoginScreen extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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