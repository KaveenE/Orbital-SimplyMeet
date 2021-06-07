import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:simply_meet/Screens/Login_SignUp/Widgets/FormBuilderEmail.dart';
import 'package:simply_meet/Screens/Login_SignUp/Widgets/FormBuilderPassword.dart';
import 'package:simply_meet/Screens/Login_SignUp/Widgets/SignUpLoginButton.dart';

class LoginArea extends StatelessWidget {
  final GlobalKey<FormBuilderState> _globalFormKey;
  final bool hidePassword;
  final VoidCallback togglePasswordVisibility;

  const LoginArea(
    this._globalFormKey, {
    required this.hidePassword,
    required this.togglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);

    return Expanded(
      child: Column(
        children: <Widget>[
          Spacer(flex: 4),
          Text(
            "LOGIN",
            style: myTheme.textTheme.headline2!
                .copyWith(color: myTheme.primaryColor),
          ),
          Spacer(flex: 3),
          FormBuilderEmail(),
          Spacer(flex: 2),
          FormBuilderPassword(
            hidePassword: hidePassword,
            onPress: togglePasswordVisibility,
            identifierForField: "password",
          ),
          Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Forgot your password?",
              style: myTheme.textTheme.subtitle2,
            ),
          ),
          Spacer(),
          SignUpLoginButton(
            _globalFormKey,
            title: "Login",
          ),
          Spacer(flex: 2),
          Text("Don't have an account?", style: myTheme.textTheme.subtitle1),
          Text(
            ">> Swipe left to sign up now! >>",
            style: myTheme.textTheme.subtitle2!
                .copyWith(decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
