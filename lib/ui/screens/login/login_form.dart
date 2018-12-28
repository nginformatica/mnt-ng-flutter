// Define a Custom Form Widget
import 'package:flutter/material.dart';
import 'package:mnt_flutter/navigation/router.dart';
import 'package:mnt_flutter/ui/screens/login/widgets/login_buttons.dart';
import 'package:mnt_flutter/ui/screens/login/widgets/login_inputs.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

Widget _inputVerticalSpace(double value) => Padding(
      padding: EdgeInsets.symmetric(vertical: value),
    );

// Define a corresponding State class. This class will hold the data related to
// the form.
class _LoginFormState extends State<LoginForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a `GlobalKey<FormState>`, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  void _onDemoPress() {
    goToHome(context);
  }

  void _onLoginPress() {}

  List<Widget> _children() => [
        _inputVerticalSpace(5.0),
        userInput(hintText: 'Usuário', iconData: Icons.person),
        _inputVerticalSpace(5.0),
        const PasswordField(hintText: 'Senha'),
        _inputVerticalSpace(5.0),
        loginButtons(onDemoPress: _onDemoPress, onLoginPress: _onLoginPress)
      ];

  @override
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: OrientationBuilder(
            builder: (context, orientation) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: orientation == Orientation.portrait
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: _children(),
                )),
      );
}
