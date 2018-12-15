import 'package:flutter/material.dart';

class DefaultLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
        value: null, valueColor: AlwaysStoppedAnimation<Color>(Colors.blue));
  }
}
