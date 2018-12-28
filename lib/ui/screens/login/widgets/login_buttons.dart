import 'package:flutter/material.dart';

const _buttonsSpace = 5.0;
const _verticalButtonPadding = 17.0;

@override
Widget loginButtons(
        {@required VoidCallback onDemoPress,
        @required VoidCallback onLoginPress}) =>
    Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _loginButton(
              color: Colors.orange, text: 'Demo', onPress: onDemoPress),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: _buttonsSpace),
          ),
          _loginButton(
              color: Colors.indigoAccent,
              text: 'Fazer login',
              onPress: onLoginPress),
        ]);

Widget _loginButton(
        {@required Color color,
        @required String text,
        @required VoidCallback onPress}) =>
    Flexible(
      fit: FlexFit.tight,
      child: FlatButton(
        padding: const EdgeInsets.symmetric(vertical: _verticalButtonPadding),
        color: color,
        textColor: Colors.white,
        child: Text(text.toUpperCase()),
        onPressed: onPress,
      ),
    );
