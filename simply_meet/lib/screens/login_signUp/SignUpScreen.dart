import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lottie/lottie.dart';

import 'package:simply_meet/screens/login_signUp/widgets/FormBuilderEmail.dart';
import 'package:simply_meet/screens/login_signUp/widgets/FormBuilderPassword.dart';
import 'package:simply_meet/screens/login_signUp/widgets/FormBuilderUsername.dart';

import 'widgets/SignUpLoginButton.dart';

class NewSignUpScreen extends StatefulWidget {
  static const routeName = "/signUpScreen";
  @override
  _NewSignUpScreenState createState() => _NewSignUpScreenState();
}

class _NewSignUpScreenState extends State<NewSignUpScreen> {
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
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Opacity(
                    opacity: 0.7,
                    child: Lottie.asset(
                        "assets/animations/TwoPeopleWorking.json",
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: DraggableScrollableSheet(
                  initialChildSize: 1,
                  builder: (ctx, scrollController) {
                    return Container(
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
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SignupArea(
                                _globalFormKey,
                                hidePassword: _hidePassword,
                                togglePasswordVisibility:
                                    togglePasswordVisibility,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupArea extends StatelessWidget {
  final GlobalKey<FormBuilderState> _globalFormKey;
  final bool hidePassword;
  final VoidCallback togglePasswordVisibility;
  const SignupArea(
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
              color: myTheme.primaryColor),
        ),
        SizedBox(height: screenSize.height * 0.03),
        FormBuilderUserName(),
        SizedBox(height: screenSize.height * 0.023),
        FormBuilderEmail(),
        SizedBox(height: screenSize.height * 0.023),
        FormBuilderPassword(
          onPress: togglePasswordVisibility,
          hidePassword: hidePassword,
          identifierForField: "password",
        ),
        SizedBox(height: screenSize.height * 0.023),
        FormBuilderPassword(
          onPress: togglePasswordVisibility,
          hidePassword: hidePassword,
          hintText: "Confirm Password",
          identifierForField: "confirmPassword",
        ),
        SizedBox(height: screenSize.height * 0.023),
        SignUpLoginButton(
          _globalFormKey,
          title: "Sign Up",
        ),
      ],
    );
  }
}
