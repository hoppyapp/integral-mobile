import 'dart:async';

import 'package:integral_nutry/screens/login/constants.dart';
import 'package:integral_nutry/shared/arquitecture.dart';


/// Login Streams Controller
class _LoginStreams implements Controller {

  /// Stream to login status
  StreamController<VisibilityAction> _visibilityStream = StreamController.broadcast();
  /// Current login status
  VisibilityAction _visibility = VisibilityAction.hideLogin;

  /// Constructor
  _LoginStreams() {
    // Listen and update current login status
    _visibilityStream.stream.listen((VisibilityAction visibility) {
      _visibility = visibility;
    });
  }

  @override
  void dispose() async {
    if(_visibilityStream != null) {
      await _visibilityStream.close();
      _visibilityStream = null;
      _visibility = null;
    }
  }
}

/// Login Controller
class LoginController extends _LoginStreams implements LoginControl {

  @override
  /// Get login status stream
  Stream<VisibilityAction> get visibilityStream => super._visibilityStream.stream;

  LoginController(): super() {

    Future.delayed(Duration(seconds: 5), () {
      super._visibilityStream.add(VisibilityAction.showLogin);
    });
  }

  
  @override
  void dispose() {
    super.dispose();
  }
  
}