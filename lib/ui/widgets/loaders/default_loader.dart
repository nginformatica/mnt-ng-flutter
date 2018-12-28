import 'package:flutter/material.dart';

class DefaultLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const CircularProgressIndicator(
      value: null, valueColor: AlwaysStoppedAnimation<Color>(Colors.blue));
}
