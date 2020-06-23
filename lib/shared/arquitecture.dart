import 'package:flutter/material.dart';
import 'package:integral_nutry/screens/access/constants.dart';

abstract class Controller {

  void dispose();

}

abstract class AccessView {

  Widget buildControl();

}

abstract class AccessControl implements Controller {

  Stream<VisibilityAction> get visibilityStream;

  Widget loadControl(AsyncSnapshot<VisibilityAction> snapshot);

}