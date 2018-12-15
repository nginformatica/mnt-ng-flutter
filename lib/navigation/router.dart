import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mnt_flutter/constants/routes.dart';
import 'package:mnt_flutter/ui/screens/home/mnt_home_screen.dart';
import 'package:mnt_flutter/ui/screens/login/login_screen.dart';

class Router {
  static var routes = <String, WidgetBuilder>{
    Routes.home: (BuildContext context) => MntHomeScreen(),
    Routes.login: (BuildContext context) => LoginScreen(),
  };

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
