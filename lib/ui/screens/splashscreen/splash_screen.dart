import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mnt_flutter/constants/assets.dart';
import 'package:mnt_flutter/constants/custom_colors.dart';
import 'package:mnt_flutter/navigation/router.dart';
import 'package:mnt_flutter/ui/widgets/loaders/default_loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => goToLogin(context));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: splashScreenBackground,
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(Assets.mntLogo, height: 50.0),
                Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  child: DefaultLoader(),
                )
              ],
            ),
          ),
        ],
      ));
}
