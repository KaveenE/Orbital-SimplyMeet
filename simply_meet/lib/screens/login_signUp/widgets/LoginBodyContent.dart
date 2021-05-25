import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:simply_meet/screens/login_signUp/LoginScreen.dart';

import '../helperWidgets/InputWidgetAreaDelete.dart';

class LoginBodyContent extends StatelessWidget {
  final Function toggleLoginSignUp;

  const LoginBodyContent({@required this.toggleLoginSignUp});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final myTheme = Theme.of(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterSwitch(
                value: true,
                onToggle: (bool invertedBoolean) =>
                    {toggleLoginSignUp(invertedBoolean)},
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.05,
                activeTextFontWeight: FontWeight.w500,
                inactiveTextFontWeight: FontWeight.w500,
                showOnOff: true,
                activeText: 'LOGIN',
                inactiveText: 'REGISTER',
                activeColor: myTheme.primaryColor,
                inactiveColor: Colors.black.withOpacity(0.35),
                activeIcon: Icon(Icons.login_rounded),
                inactiveIcon: Icon(Icons.create_rounded),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Image.asset("assets/images/loginImageFinal.png",
                  width: double.infinity),
              InputWidgetAreaDelete(
                child: Column(
                  children: [
                    InputWidgetDelete(
                      hintText: "Username",
                      leadingIcon: Icon(
                        Icons.person,
                        color: myTheme.primaryColor,
                      ),
                    ),
                    InputWidgetDelete(
                      hintText: "Password",
                      obscureText: true,
                      leadingIcon: Icon(
                        Icons.lock_rounded,
                        color: myTheme.primaryColor,
                      ),
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.04,
              ),
              SizedBox(
                width: screenSize.width * 0.85,
                height: screenSize.height * 0.08,
                child: ElevatedButton(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(myTheme.primaryColor),
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(LoginScreen.routeName),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
