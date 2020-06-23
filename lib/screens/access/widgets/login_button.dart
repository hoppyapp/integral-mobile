import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:integral_nutry/screens/access/constants.dart';

class LoginButton extends StatelessWidget {

  final Login login;
  final void Function() onLogin;

  LoginButton(this.login, { this.onLogin });

  @override
  Widget build(BuildContext context) {

    String svgName;
    double height = 40;

    switch(this.login) {
      case Login.google: 
        svgName = "google";
        break;

      case Login.facebook:
        svgName = "facebook";
        break;

      default: Exception(this.login);
    }

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(height/2),
        border: Border.all(color: Color(0xffc6c6c6), width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: this.onLogin,
          child: Center(
            child: SvgPicture.asset("assets/images/svg/$svgName.svg", height: 25)
          ),
        ),
      ),
    );
  }

}