import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simply_meet/screens/Login_SignUp/NewLoginScreen.dart';
import 'package:simply_meet/screens/Login_SignUp/Widgets/EmailTextField.dart';
import 'package:simply_meet/screens/Login_SignUp/Widgets/SignUpButton.dart';
import 'package:simply_meet/screens/Login_SignUp/Widgets/UsernameTextField.dart';

class NewSignUpScreen extends StatefulWidget {
  @override
  _NewSignUpScreenState createState() => _NewSignUpScreenState();
}

class _NewSignUpScreenState extends State<NewSignUpScreen> {
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: myTheme.primaryColor,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                      child: Opacity(
                          opacity: 0.7,
                          child: Lottie.asset(
                              "assets/animations/TwoPeopleWorking.json",
                              width: screenSize.height * 0.52)))),
              Expanded(
                flex: 3,
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: Padding(
                      padding: EdgeInsets.all(screenSize.height * 0.04),
                      child: Form(
                          key: globalFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'This is a placeholder for a slider',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: myTheme.primaryColor),
                              ),
                              SizedBox(height: screenSize.height * 0.03),
                              UsernameTextField(),
                              SizedBox(height: screenSize.height * 0.023),
                              EmailTextField(),
                              SizedBox(height: screenSize.height * 0.023),
                              passwordTextField(),
                              SizedBox(height: screenSize.height * 0.023),
                              confirmPasswordTextField(),
                              SizedBox(height: screenSize.height * 0.023),
                              SignUpButton(myTheme: myTheme),
                              SizedBox(height: screenSize.height * 0.014),
                              RichText(
                                  text: TextSpan(
                                      text: "Already have an account? ",
                                      style: TextStyle(
                                          color: Colors.grey.shade800),
                                      children: <TextSpan>[
                                    TextSpan(
                                      text: "Login",
                                      style: TextStyle(
                                          color: Colors.grey.shade800,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return NewLoginScreen();
                                            })),
                                    )
                                  ]))
                            ],
                          )),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

// Extracted Methods
  TextFormField confirmPasswordTextField() {
    return TextFormField(
        keyboardType: TextInputType.text,
        //onSaved: ,
        validator: (input) => input.length < 7
            ? "Password should be more than 7 characters"
            : null,
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color(0xffCDC6DE),
            hintText: "Confirm Password",
            contentPadding: EdgeInsets.only(left: 25),
            suffixIcon: Icon(
              Icons.lock,
              color: Colors.grey.shade700,
            )));
  }

  TextFormField passwordTextField() {
    return TextFormField(
        keyboardType: TextInputType.text,
        //onSaved: ,
        validator: (input) => input.length < 7
            ? "Password should be more than 7 characters"
            : null,
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color(0xffCDC6DE),
            hintText: "Password",
            contentPadding: EdgeInsets.only(left: 25),
            suffixIcon: Icon(
              Icons.lock,
              color: Colors.grey.shade700,
            )));
  }
}
