import 'package:integral_nutry/screens/login/constants.dart';

abstract class Controller {

  void dispose();

}

abstract class LoginControl implements Controller {

  Stream<login_status> get statusStream;
  login_status get status;

}