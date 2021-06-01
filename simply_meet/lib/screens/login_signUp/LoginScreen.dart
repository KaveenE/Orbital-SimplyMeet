import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lottie/lottie.dart';
import 'package:simply_meet/Screens/Login_SignUp/SignUpScreen.dart';
import 'package:simply_meet/screens/login_signUp/widgets/FormBuilderEmail.dart';
import 'package:simply_meet/screens/login_signUp/widgets/FormBuilderPassword.dart';
import 'package:simply_meet/screens/login_signUp/widgets/SignUpLoginButton.dart';
import 'package:simply_meet/screens/login_signUp/widgets/WordsBelowSignUpLogin.dart';

class NewLoginScreen extends StatefulWidget {
  static const routeName = '/loginScreen';

  @override
  _NewLoginScreenState createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  bool _hidePassword = true;
  GlobalKey<FormBuilderState> _globalFormKey = GlobalKey<FormBuilderState>();

  @override
  initState() {
    super.initState();
    _hidePassword = true;
    _globalFormKey = GlobalKey<FormBuilderState>();
  }

  void togglePasswordVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: myTheme.primaryColor,
          height: screenSize.height,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 9,
                child: Opacity(
                  opacity: 0.7,
                  child: Lottie.asset("assets/animations/GirlOnPhone.json",
                      width: screenSize.height * 0.45),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(screenSize.height * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: FormBuilder(
                    key: _globalFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        LoginArea(
                          _globalFormKey,
                          hidePassword: _hidePassword,
                          togglePasswordVisibility: togglePasswordVisibility,
                        ),
                        SizedBox(height: screenSize.height * 0.014),
                        WordsBelowSignUpLogin(
                          text1: "Don't have an account? ",
                          text2: "Sign up",
                          route: NewSignUpScreen.routeName,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginArea extends StatelessWidget {
  final GlobalKey<FormBuilderState> _globalFormKey;
  final bool hidePassword;
  final VoidCallback togglePasswordVisibility;
  const LoginArea(
    this._globalFormKey, {
    @required this.hidePassword,
    @required this.togglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final myTheme = Theme.of(context);
    return Column(
      children: [
        Text(
          'This is a placeholder for a slider',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: myTheme.primaryColor,
          ),
        ),
        SizedBox(height: screenSize.height * 0.03),
        FormBuilderEmail(),
        SizedBox(height: screenSize.height * 0.027),
        FormBuilderPassword(
          hidePassword: hidePassword,
          onPress: togglePasswordVisibility,
          identifierForField: "password",
        ),
        SizedBox(height: screenSize.height * 0.014),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Forgot your password?",
            style: myTheme.textTheme.subtitle2,
          ),
        ),
        SizedBox(height: screenSize.height * 0.02),
        SignUpLoginButton(
          _globalFormKey,
          title: "Login",
        ),
      ],
    );
  }
}
