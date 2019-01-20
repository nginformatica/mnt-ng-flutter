import 'package:flutter/material.dart';
import 'package:mnt_flutter/constants/assets.dart';
import 'package:mnt_flutter/constants/custom_colors.dart';
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
    // Timer(Duration(seconds: 2), () => goToLogin(context));
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        );

    final mainText = Text(
      'Conectando dispositivo',
      style: text.title,
    );

    return Scaffold(
        backgroundColor: splashScreenBackground,
        body: Stack(
          children: <Widget>[
            Center(
              child: Image.asset(Assets.mntLogoWhite, height: 50.0),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    children: <Widget>[DefaultLoader(), mainText]),
              ),
            )
          ],
        ));
  }
}
