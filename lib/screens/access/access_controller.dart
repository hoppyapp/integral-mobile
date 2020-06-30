import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:integral_nutry/screens/access/constants.dart';
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
class LoginController extends _LoginStreams implements AccessControl {

  final AccessView _view;
  final GoogleSignIn _google = GoogleSignIn(scopes: <String>[
    /// Link to see scopes: https://developers.google.com/identity/protocols/oauth2/scopes
    "profile",
    "email"
  ]);
  bool _logining = false;

  @override
  /// Get login status stream
  Stream<VisibilityAction> get visibilityStream => super._visibilityStream.stream;

  /// Login Controller
  /// Constructor
  LoginController(this._view): super() {

    Future.delayed(Duration(seconds: 5), () {
      super._visibilityStream.add(VisibilityAction.showLogin);
    });
  }

  Future<void> _googleSignIn() async {
    try {

      GoogleSignInAccount account = await _google.signIn();

      print(account);

    } catch(e) {
      throw e;
    }
  }

  @override
  Function toLogin(Login login) {
    return () {
      if(!_logining) {
        _logining = !_logining;
        switch(login) {
          case Login.google:
            _googleSignIn().then((void _) {
              // Show register

            }, onError: (e) {
              print("[ google_sign_in ] error: $e");
              _logining = !_logining;
            });
            break;

          case Login.facebook:
            break;

          default: Exception(login);
        }
      }
    };
  }

  @override
  /// Load control to the user
  Widget loadControl(AsyncSnapshot<VisibilityAction> snapshot) {

    if(!snapshot.hasData) return Container();

    switch(snapshot.data) {

      // Hide login to show register
      case VisibilityAction.hideLogin: return _view.buildControl(show: false, onEnd: () {
        super._visibilityStream.add(VisibilityAction.showRegister);
      });

      // Show register
      case VisibilityAction.showRegister: return _view.buildControl(show: true, register: true);

      // Show register
      case VisibilityAction.showLogin: return _view.buildControl(show: true);

      // Hide register to show login
      case VisibilityAction.hideRegister: return _view.buildControl(show: false, register: true, onEnd: () {
        super._visibilityStream.add(VisibilityAction.showLogin);
      });

      default: Exception(snapshot.data);

    }

    return _view.buildControl();
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  void testRegister() {
    super._visibilityStream.add(VisibilityAction.hideLogin);
  }

  @override
  void textLogin() {
    super._visibilityStream.add(VisibilityAction.hideRegister);
  }
  
}