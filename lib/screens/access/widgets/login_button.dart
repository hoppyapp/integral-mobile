import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:integral_nutry/screens/access/constants.dart';

/// Login Button
/// 
/// At acccess screen to login with Google and Facebook
class LoginButton extends StatelessWidget {

  /// Attributes
  final Login login;
  final void Function() onLogin;

  /// Constructor
  LoginButton(this.login, { this.onLogin });

  @override
  /// Build widget
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width * 0.75;
    final double marginWidth =  (MediaQuery.of(context).size.width - width) / 2;
    final double height = 40;

    String svgName;

    switch(this.login) {
      case Login.google: 
        svgName = "google";
        break;

      case Login.facebook:
        svgName = "facebook";
        break;

      default: Exception(this.login);
    }

    // Return widget
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: marginWidth, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(height/2),
        border: Border.all(color: Color(0xffc6c6c6), width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: this.onLogin,
          child: Center(
            child: SvgPicture.asset("assets/images/svg/$svgName.svg", height: 20)
          ),
        ),
      ),
    );
  }

}