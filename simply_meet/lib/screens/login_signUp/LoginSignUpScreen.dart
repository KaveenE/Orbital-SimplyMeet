import 'package:flutter/material.dart';
import 'package:simply_meet/screens/login_signUp/SignUpScreen.dart';

import '../login_signUp/LoginScreen.dart';

class LoginSignUpScreen extends StatefulWidget {
  static const routeName = "/loginSignUpScreen";

  @override
  _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  bool isLogin = true;

  void toggleLoginSignUp(bool newBoolForLogin) {
    setState(() {
      isLogin = newBoolForLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginScreen(toggleLoginSignUp: toggleLoginSignUp)
        : SignUpScreen(toggleLoginSignUp: toggleLoginSignUp);
  }
}
