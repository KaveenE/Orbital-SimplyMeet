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
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Opacity(
                  opacity: 0.7,
                  child: Lottie.asset("assets/animations/GirlOnPhone.json",
                      width: screenSize.height * 0.5),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(screenSize.height * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
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
                        // Spacer(),
                        LoginArea(
                          _globalFormKey,
                          hidePassword: _hidePassword,
                          togglePasswordVisibility: togglePasswordVisibility,
                        ),
                        // Spacer(),
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
    required this.hidePassword,
    required this.togglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);

    return Expanded(
      child: Column(
        children: <Widget>[
          const Spacer(),
          FormBuilderEmail(),
          Spacer(),
          FormBuilderPassword(
            hidePassword: hidePassword,
            onPress: togglePasswordVisibility,
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
             Spacer(),
          SignUpLoginButton(
            _globalFormKey,
            title: "Login",
          ),
          const Spacer(),
          WordsBelowSignUpLogin(
            text1: "Don't have an account? ",
            text2: "Sign up",
            route: NewSignUpScreen.routeName,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
