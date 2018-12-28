import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mnt_flutter/navigation/router.dart';
import 'package:mnt_flutter/ui/screens/splashscreen/splash_screen.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MntApp());
}

class MntApp extends StatelessWidget {
  // This widget is the root of your application.
  MntApp()
      : assert(() {
          Sqflite.setDebugModeOn(true);
          return true;
        }());

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mnt application',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const SplashScreen(title: 'Mnt Splash Screen'),
        routes: routes,
      );
}
