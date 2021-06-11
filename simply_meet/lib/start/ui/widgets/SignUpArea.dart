import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';
import 'package:simply_meet/start/ui/helper_widgets/FormBuilderEmail.dart';
import 'package:simply_meet/start/ui/helper_widgets/FormBuilderPassword.dart';
import 'package:simply_meet/start/ui/helper_widgets/FormBuilderUserName.dart';

import 'package:simply_meet/start/ui/helper_widgets/SignUpLoginButton.dart';
import 'package:simply_meet/start/view_models/login_signup_view_model.dart';

class SignUpArea extends StatelessWidget {
  const SignUpArea();

  @override
  Widget build(BuildContext context) {
    final loginSignUpViewModel = Provider.of<LoginSignUpViewModel>(context);

    return Expanded(
      child: Column(
        children: <Widget>[
          const Spacer(flex: 2),
          Text(
            "SIGN UP",
            style: theme(context)
                .textTheme
                .headline2!
                .copyWith(color: theme(context).primaryColor),
          ),
          const Spacer(flex: 2),
          const FormBuilderUserName(),
          const Spacer(),
          const FormBuilderEmail(),
          const Spacer(),
          const FormBuilderPassword(
            identifierForField: "password",
          ),
          const Spacer(),
          const FormBuilderPassword(
            hintText: "Confirm Password",
            identifierForField: "confirmPassword",
          ),
          const Spacer(),
          SignUpLoginButton(
            title: "Sign Up",
            busy: loginSignUpViewModel.busy,
            loginSignupAction: () => loginSignUpViewModel.signUp(
                formKey: loginSignUpViewModel.globalFormKeyList[1] , context: context,),
          ),
          const Spacer(),
          Text("Already have an account?",
              style: theme(context).textTheme.subtitle1),
          Text(
            "<< Swipe right to login <<",
            style: theme(context)
                .textTheme
                .subtitle2!
                .copyWith(decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
