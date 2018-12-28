import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mnt_flutter/constants/routes.dart';
import 'package:mnt_flutter/ui/screens/home/mnt_home_screen.dart';
import 'package:mnt_flutter/ui/screens/login/login_screen.dart';

var routes = <String, WidgetBuilder>{
  Routes.home: (context) => const MntHomeScreen(),
  Routes.login: (context) => const LoginScreen(),
};

void goToHome(BuildContext context) {
  Navigator.pushReplacementNamed(context, Routes.home);
}

void goToLogin(BuildContext context) {
  Navigator.pushReplacementNamed(context, Routes.login);
}

void setStatusBarState({@required bool shown}) {
  if (shown) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  } else {
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
}
