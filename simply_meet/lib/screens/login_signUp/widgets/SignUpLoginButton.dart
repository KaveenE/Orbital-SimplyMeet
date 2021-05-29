import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Combine Login & Singup Button

class SignUpLoginButton extends StatelessWidget {
  final String title;
  final GlobalKey<FormBuilderState> _globalFormKey;

  const SignUpLoginButton(
    this._globalFormKey, {
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: myTheme.primaryColor,
          padding: EdgeInsets.symmetric(vertical: 10),
          textStyle: myTheme.textTheme.button,
        ),
        
        onPressed: () {
          //Actually, you'd often call a server or save the information in a database. We'll do that soon...
          if (_globalFormKey.currentState.validate()) {
            _globalFormKey.currentState.save();
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  title.startsWith("lo") ? "Logging in..." + _globalFormKey.currentState.value.toString() : "Signing up..." + _globalFormKey.currentState.value.toString()),
            ),
          );
        },
        child: Text(title),
      ),
    );
  }
}
