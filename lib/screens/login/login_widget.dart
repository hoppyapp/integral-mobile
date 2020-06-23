import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:integral_nutry/screens/init.dart';
import 'package:integral_nutry/screens/login/constants.dart';
import 'package:integral_nutry/shared/arquitecture.dart';
import 'package:integral_nutry/shared/widgets/label.dart';

import 'login_controller.dart';

/// Login Screen
class LoginScreen extends State<Login> {

  // Attributes
  LoginControl _controller;

  @override
  void initState() {
    super.initState();

    // Start controller
    if(_controller == null) _controller = LoginController();
  }

  @override
  Widget build(BuildContext context) {

    final double logoContainerHeight = MediaQuery.of(context).size.height * 0.45;
    final double controlContainerHeight = MediaQuery.of(context).size.height * 0.55;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/gifs/background.gif"),
          fit: BoxFit.cover
        )
      ),
      child: Column(
        children: <Widget>[

          // Logo container
          Container(
            height: logoContainerHeight,
            child: Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1), 
                duration: Duration(milliseconds: 500),
                child: SvgPicture.asset("assets/images/svg/logo.svg", height: 70), 
                builder: (BuildContext context, double opacity, Widget child) {
                  return Opacity(
                    opacity: opacity,
                    child: child,
                  );
                }
              ),
            ),
          ),

          // Control container
          Container(
            height: controlContainerHeight,
            child: Container(),
          ),
        ],
      )
    );
  }
}