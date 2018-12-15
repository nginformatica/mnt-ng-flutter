// Define a Custom Form Widget
import 'package:flutter/material.dart';
import 'package:mnt_flutter/navigation/router.dart';
import 'package:mnt_flutter/ui/screens/login/widgets/login_buttons.dart';
import 'package:mnt_flutter/ui/screens/login/widgets/login_inputs.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => new _LoginFormState();
}

Widget _InputVerticalSpace(double value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: value),
  );
}

// Define a corresponding State class. This class will hold the data related to
// the form.
class _LoginFormState extends State<LoginForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a `GlobalKey<FormState>`, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  _onDemoPress() {
    Router.goToHome(context);
  }

  _onLoginPress() {}

  List<Widget> _children() {
    return [
      _InputVerticalSpace(5.0),
      UserInput(hintText: "Usuário", iconData: Icons.person),
      _InputVerticalSpace(5.0),
      PasswordField(hintText: "Senha"),
      _InputVerticalSpace(5.0),
      LoginButtons(onDemoPress: _onDemoPress, onLoginPress: _onLoginPress)
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: OrientationBuilder(builder: (context, orientation) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: orientation == Orientation.portrait
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: _children(),
        );
      }),
    );
  }
}
