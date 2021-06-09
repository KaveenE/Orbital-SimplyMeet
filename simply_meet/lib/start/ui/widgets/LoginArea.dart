import 'package:flutter/material.dart';
import 'package:simply_meet/Screens/Login_SignUp/Widgets/FormBuilderEmail.dart';
import 'package:simply_meet/Screens/Login_SignUp/Widgets/FormBuilderPassword.dart';
import 'package:simply_meet/start/ui/helper_widgets/SignUpLoginButton.dart';

class LoginArea extends StatelessWidget {
  const LoginArea();

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);

    return Expanded(
      child: Column(
        children: <Widget>[
          const Spacer(flex: 4),
          Text(
            "LOGIN",
            style: myTheme.textTheme.headline2!
                .copyWith(color: myTheme.primaryColor),
          ),
          const Spacer(flex: 3),
          const FormBuilderEmail(),
          const Spacer(flex: 2),
          FormBuilderPassword(
            identifierForField: "password",
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Forgot your password?",
              style: myTheme.textTheme.subtitle2,
            ),
          ),
          const Spacer(),
          SignUpLoginButton(title: "Login", loginSignup: () {}),
          const Spacer(flex: 2),
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
