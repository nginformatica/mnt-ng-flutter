import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mnt_flutter/constants/routes.dart';
import 'package:mnt_flutter/ui/screens/home/mnt_home_screen.dart';
import 'package:mnt_flutter/ui/screens/login/login_screen.dart';
import 'package:mnt_flutter/ui/screens/service/order/create/s_o_create_screen.dart';

var routes = <String, WidgetBuilder>{
  Routes.home: (context) => const MntHomeScreen(),
  Routes.login: (context) => const LoginScreen(),
  Routes.orderCreate: (context) => ServiceOrderCreateScreen(),
};

void goToHome(BuildContext context) {
  Navigator.pushReplacementNamed(context, Routes.home);
}

void goToLogin(BuildContext context) {
  Navigator.pushReplacementNamed(context, Routes.login);
}

void goToCreateOrder(BuildContext context) {
  Navigator.pushReplacementNamed(context, Routes.orderCreate);
}

void setStatusBarState({@required bool shown}) {
  if (shown) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  } else {
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
}
