import 'package:flutter/material.dart';
import 'package:integral_nutry/screens/access/constants.dart';

abstract class Controller {

  void dispose();

}

abstract class AccessView {

  Widget buildControl({ bool show = true, bool register = false, Function() onEnd });

}

abstract class AccessControl implements Controller {

  Stream<VisibilityAction> get visibilityStream;

  Widget loadControl(AsyncSnapshot<VisibilityAction> snapshot);

  void testRegister();

  void textLogin();

}