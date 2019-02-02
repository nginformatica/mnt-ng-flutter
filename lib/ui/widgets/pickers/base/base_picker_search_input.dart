import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasePickerSearchInput extends StatelessWidget {
  const BasePickerSearchInput({
    @required this.hintText
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(
      prefixIcon: Icon(Icons.search),
      border: UnderlineInputBorder(),
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 18)
    );

    return Padding(
      padding: EdgeInsets.all(5.0),
      child: TextField(
        maxLines: 1,
        decoration: decoration,
        onChanged: (text) {},
      )
    );
  }
}