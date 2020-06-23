import 'package:flutter/material.dart';
import 'package:integral_nutry/screens/login/constants.dart';

abstract class Controller {

  void dispose();

}

abstract class LoginView {

  Widget buildControl();

}

abstract class LoginControl implements Controller {

  Stream<VisibilityAction> get visibilityStream;

  Widget loadControl();

}