import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasePickerOption extends StatelessWidget {
  const BasePickerOption({
      @required this.onPressed,
      @required this.title,
      @required this.subtitle
  });

  final VoidCallback onPressed;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            subtitle,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
