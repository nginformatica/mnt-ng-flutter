import 'package:flutter/material.dart';

const _buttonsSpace = 5.0;
const _verticalButtonPadding = 17.0;

@override
Widget LoginButtons(
    {@required VoidCallback onDemoPress, @required VoidCallback onLoginPress}) {
  return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _LoginButton(color: Colors.orange, text: "Demo", onPress: onDemoPress),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _buttonsSpace),
        ),
        _LoginButton(
            color: Colors.indigoAccent,
            text: "Fazer login",
            onPress: onLoginPress),
      ]);
}

Widget _LoginButton({@required Color color,
  @required String text,
  @required VoidCallback onPress}) {
  return Flexible(
    fit: FlexFit.tight,
    child: FlatButton(
      padding: EdgeInsets.symmetric(vertical: _verticalButtonPadding),
      color: color,
      textColor: Colors.white,
      child: Text(text.toUpperCase()),
      onPressed: onPress,
    ),
  );
}
