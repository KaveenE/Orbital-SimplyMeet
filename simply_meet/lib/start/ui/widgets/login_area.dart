import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';
import 'package:simply_meet/start/ui/helper_widgets/formbuilder_email.dart';
import 'package:simply_meet/start/ui/helper_widgets/formbuilder_password.dart';

import 'package:simply_meet/start/ui/helper_widgets/signup_login_button.dart';
import 'package:simply_meet/start/ui/views/forget_password.dart';
import 'package:simply_meet/start/view_models/login_signup_view_model.dart';

class LoginArea extends StatelessWidget {
  const LoginArea();

  @override
  Widget build(BuildContext context) {
    final loginSignUpViewModel = Provider.of<LoginSignUpViewModel>(context);

    return Expanded(
      child: Column(
        children: <Widget>[
          const Spacer(flex: 4),
          Text(
            "LOGIN",
            style: theme(context)
                .textTheme
                .headline2!
                .copyWith(color: theme(context).primaryColor),
          ),
          const Spacer(flex: 2),
          const FormBuilderEmail(),
          const Spacer(flex: 2),
          FormBuilderPassword(
            identifierForField: "password",
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(ForgetPasswordView.routeName),
              child: Text(
                "Forgot your password?",
                style:
                    theme(context).textTheme.subtitle2!.copyWith(fontSize: 15),
              ),
            ),
          ),

          SignUpLoginButton(
            title: "Login",
            loginSignupAction: () => loginSignUpViewModel.logIn(
              formKey: loginSignUpViewModel.globalFormKeyList[0],
              context: context,
            ),
            busy: loginSignUpViewModel.busy,
          ),
          const Spacer(flex: 2),
          Text("Don't have an account?",
              style: theme(context).textTheme.subtitle1),
          Text(
            ">> Swipe left to sign up now! >>",
            style: theme(context)
                .textTheme
                .subtitle2!
                .copyWith(decoration: TextDecoration.none),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
