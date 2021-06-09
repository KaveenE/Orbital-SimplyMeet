import 'package:flutter/material.dart';

import 'package:simply_meet/Screens/Login_SignUp/Widgets/FormBuilderEmail.dart';
import 'package:simply_meet/Screens/Login_SignUp/Widgets/FormBuilderPassword.dart';
import 'package:simply_meet/Screens/Login_SignUp/Widgets/FormBuilderUserName.dart';
import 'package:simply_meet/start/ui/helper_widgets/SignUpLoginButton.dart';

class SignUpArea extends StatelessWidget {


  const SignUpArea();

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);

    return Expanded(
      child: Column(
        children: <Widget>[
          Spacer(flex: 2),
          Text(
            "SIGN UP",
            style: myTheme.textTheme.headline2!
                .copyWith(color: myTheme.primaryColor),
          ),
          Spacer(flex: 2),
          FormBuilderUserName(),
          Spacer(),
          FormBuilderEmail(),
          Spacer(),
          FormBuilderPassword(
            identifierForField: "password",
          ),
          Spacer(),
          FormBuilderPassword(
            hintText: "Confirm Password",
            identifierForField: "confirmPassword",
          ),
          Spacer(),
          SignUpLoginButton(
            title: "Sign Up",
            loginSignup: () {},
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
