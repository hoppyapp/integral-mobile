import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:integral_nutry/screens/init.dart';
import 'package:integral_nutry/screens/access/constants.dart';
import 'package:integral_nutry/screens/access/access_controller.dart';
import 'package:integral_nutry/shared/arquitecture.dart';

/// Login Screen
class AccessScreen extends State<Access> implements AccessView {

  // Attributes
  AccessControl _controller;

  @override
  void initState() {
    super.initState();

    // Start controller
    if(_controller == null) _controller = LoginController(this);
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
            child: StreamBuilder<VisibilityAction>(
              stream: _controller.visibilityStream,
              builder: (BuildContext context, AsyncSnapshot<VisibilityAction> snapshot) {
                return _controller.loadControl(snapshot);
              }
            ),
          ),
        ],
      )
    );
  }

  @override
  Widget buildControl({ show = true, register = false, Function() onEnd }) {

    return TweenAnimationBuilder<double>(
      tween: show ? Tween(begin: 0, end: 1) : Tween(begin: 1, end: 0),
      duration: Duration(milliseconds: 500), 
      builder: (BuildContext context, double animation, Widget child) {
        return Opacity(
          opacity: animation,
          child: Container(
            margin: EdgeInsets.only(top: 100 * (1 - animation)),
            child: () {
              if(register) {
                return Container();
              } else {
                return Container();
              }
            } ()
          ),
        );
      }
    );
  }
  
}