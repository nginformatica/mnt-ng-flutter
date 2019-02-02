import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasePickerInput extends StatelessWidget {
  const BasePickerInput({
    @required this.labelText,
    @required this.onTap
  });

  final GestureTapCallback onTap;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: true,
        child: TextFormField(
          style: textTheme.title.copyWith(
              fontWeight: FontWeight.normal
          ),
          decoration: InputDecoration(
              labelText: labelText,
              hasFloatingPlaceholder: true
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
          },
        ),
      ),
    );
  }
}
