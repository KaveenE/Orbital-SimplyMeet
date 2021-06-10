import 'package:flutter/material.dart';
import 'package:simply_meet/shared/ui_helpers.dart';

class SignUpLoginButton extends StatelessWidget {
  final String title;
  final bool busy;
  final VoidCallback loginSignupAction;

  const SignUpLoginButton({
    required this.title,
    required this.loginSignupAction,
    required this.busy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: theme(context).primaryColor,
          padding: EdgeInsets.symmetric(vertical: 10),
          textStyle: theme(context).textTheme.button,
        ),
        onPressed: this.loginSignupAction,
        child: busy
            ? CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              )
            : Text(title),
      ),
    );
  }
}
