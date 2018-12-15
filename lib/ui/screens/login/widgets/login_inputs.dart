import 'package:flutter/material.dart';

const border =
    OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(3.0)));

Widget UserInput({@required String hintText, @required IconData iconData}) {
  return TextFormField(
    decoration: InputDecoration(
        prefixIcon: Icon(
          iconData,
        ),
        border: border,
        filled: true,
        fillColor: Colors.white,
        hintText: hintText),
    validator: (value) {
      if (value.isEmpty) {
        return 'Please enter some text';
      }
    },
  );
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: border,
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hintText,
        prefixIcon: Icon(Icons.lock),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            semanticLabel: _obscureText ? 'show password' : 'hide password',
          ),
        ),
      ),
    );
  }
}
