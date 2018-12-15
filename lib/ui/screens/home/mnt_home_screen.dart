import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mnt_flutter/constants/assets.dart';
import 'package:mnt_flutter/navigation/router.dart';
import 'package:mnt_flutter/ui/widgets/loaders/default_loader.dart';

class MntHomeScreen extends StatefulWidget {
  MntHomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MntHomeScreenState createState() => new _MntHomeScreenState();
}

class _MntHomeScreenState extends State<MntHomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => Router.goToHome(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigoAccent,
        body: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(Assets.appIcon, width: 100.0),
                  Text(
                    'Nice Animals',
                    style: Theme.of(context).textTheme.display1,
                  ),
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
}
