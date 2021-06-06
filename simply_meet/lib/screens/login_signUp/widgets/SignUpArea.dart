import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:simply_meet/Screens/Login_SignUp/Widgets/FormBuilderEmail.dart';
import 'package:simply_meet/Screens/Login_SignUp/Widgets/FormBuilderPassword.dart';
import 'package:simply_meet/Screens/Login_SignUp/Widgets/FormBuilderUserName.dart';
import 'package:simply_meet/Screens/Login_SignUp/Widgets/SignUpLoginButton.dart';

class SignUpArea extends StatelessWidget {
  final GlobalKey<FormBuilderState> _globalFormKey;
  final bool hidePassword;
  final VoidCallback togglePasswordVisibility;

  const SignUpArea(
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
          Spacer(flex: 2),
          Text(
            "Sign Up Page",
            style: myTheme.textTheme.headline2!
                .copyWith(color: myTheme.primaryColor),
          ),
          Spacer(flex: 2),
          FormBuilderUserName(),
          Spacer(),
          FormBuilderEmail(),
          Spacer(),
          FormBuilderPassword(
            onPress: togglePasswordVisibility,
            hidePassword: hidePassword,
            identifierForField: "password",
          ),
          Spacer(),
          FormBuilderPassword(
            onPress: togglePasswordVisibility,
            hidePassword: hidePassword,
            hintText: "Confirm Password",
            identifierForField: "confirmPassword",
          ),
          Spacer(),
          SignUpLoginButton(
            _globalFormKey,
            title: "Sign Up",
          ),
          Spacer(),
          Text("Already have an account?", style: myTheme.textTheme.subtitle1),
          Text(
            "<< Swipe right to login <<",
            style: myTheme.textTheme.subtitle2!
                .copyWith(decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
