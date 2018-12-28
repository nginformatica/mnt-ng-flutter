import 'package:flutter/material.dart';
import 'package:mnt_flutter/ui/screens/login/login_form.dart';
import 'package:mnt_flutter/ui/screens/login/widgets/login_logo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> _children(
          {@required int logoWeight, @required int formWeight}) =>
      [
        Expanded(
          child: loginLogo(width: 200.0, height: 70.0),
          flex: logoWeight,
        ),
        Expanded(
          child: LoginForm(),
          flex: formWeight,
        ),
      ];

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return Row(children: _children(formWeight: 1, logoWeight: 1));
          } else {
            return Column(children: _children(formWeight: 3, logoWeight: 2));
          }
        }),
      ));
}
