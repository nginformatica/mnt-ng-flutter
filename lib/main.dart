import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mnt_flutter/constants/routes.dart';
import 'package:mnt_flutter/ui/screens/home/mnt_home_screen.dart';
import 'package:mnt_flutter/ui/screens/login/login_screen.dart';
import 'package:mnt_flutter/ui/screens/splashscreen/splash_screen.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(new MntApp());
}

var routes = <String, WidgetBuilder>{
  Routes.home: (BuildContext context) => MntHomeScreen(),
  Routes.login: (BuildContext context) => LoginScreen(),
};

class MntApp extends StatelessWidget {
  // This widget is the root of your application.
  MntApp() {
    assert(() {
      Sqflite.setDebugModeOn(true);
      return true;
    }());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mnt application',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: SplashScreen(title: 'Mnt Splash Screen'),
      routes: routes,
    );
  }
}
