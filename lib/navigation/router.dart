import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mnt_flutter/constants/routes.dart';

class Router {
  static void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.login);
  }

  static void setStatusBarState({@required bool shown}) {
    if (shown) {
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    } else {
      SystemChrome.setEnabledSystemUIOverlays([]);
    }
  }
}
