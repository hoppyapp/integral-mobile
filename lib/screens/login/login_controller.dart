import 'dart:async';

import 'package:integral_nutry/screens/login/constants.dart';
import 'package:integral_nutry/shared/arquitecture.dart';


/// Login Streams Controller
class _LoginStreams implements Controller {

  /// Stream to login status
  StreamController<login_status> _statusStream = StreamController.broadcast();
  /// Current login status
  login_status _status = login_status.loading;

  /// Constructor
  _LoginStreams() {
    // Listen and update current login status
    _statusStream.stream.listen((login_status status) {
      _status = status;
    });
  }

  @override
  void dispose() async {
    if(_statusStream != null) {
      await _statusStream.close();
      _statusStream = null;
      _status = null;
    }
  }
}

/// Login Controller
class LoginController extends _LoginStreams implements LoginControl {

  @override
  /// Get login status stream
  Stream<login_status> get statusStream => super._statusStream.stream;

  @override
  /// Get login status current
  login_status get status => super._status;

  LoginController(): super() {

    Future.delayed(Duration(seconds: 5), () {
      super._statusStream.add(login_status.login);
    });
  }

  
  @override
  void dispose() {
    super.dispose();
  }
  
}