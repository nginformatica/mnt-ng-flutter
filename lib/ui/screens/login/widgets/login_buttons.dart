import 'package:flutter/material.dart';

class LoginButtons extends StatelessWidget {
  static const _buttonsSpace = 5.0;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _LoginButton(color: Colors.orange, text: "Demo"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _buttonsSpace),
          ),
          _LoginButton(color: Colors.indigoAccent, text: "Fazer login"),
        ]);
  }
}

class _LoginButton extends StatelessWidget {
  static const _verticalButtonPadding = 17.0;
  final Color color;
  final String text;

  const _LoginButton({@required this.color, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: _verticalButtonPadding),
        color: this.color,
        textColor: Colors.white,
        child: Text(this.text.toUpperCase()),
        onPressed: () {},
      ),
    );
  }
}
