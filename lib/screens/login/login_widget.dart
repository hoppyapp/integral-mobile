import 'package:flutter/material.dart';
import 'package:integral_nutry/screens/init.dart';
import 'package:integral_nutry/screens/login/constants.dart';
import 'package:integral_nutry/shared/widgets/label.dart';

import 'login_controller.dart';

class LoginScreen extends State<Login> {

  LoginController _controller;

  @override
  void initState() {
    super.initState();

    if(_controller == null) _controller = LoginController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/gifs/background.gif"),
          fit: BoxFit.cover
        )
      ),
      child: StreamBuilder<login_status>(
        initialData: _controller.status,
        stream: _controller.statusStream,
        builder: (BuildContext context, AsyncSnapshot<login_status> snapshot) {

          if(!snapshot.hasData) return Container();

          switch(snapshot.data) {
            case login_status.loading:
              return _buildLogin();

            case login_status.logged:
              return _buildLogin();

            case login_status.login:
              return _buildLogin(show: true);

            default: throw Exception();
          }
        },
      )
    );
  }

  Widget _buildLogin({ bool show = false}) {

    print("[ LOGIN SCREEN ] method(_buildLogin)");

    return Center(
      child: AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: show ? 1 : 0,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  child: Label("Logo IntegralNutry"),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  padding: EdgeInsets.only(top: show ? 0 : 50),
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Label("Login Google"),
                      Label("Login Facebook")
                    ],
                  ),
                ),
              )
            ),
          ],
        )
      )
    );

  }

}