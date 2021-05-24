import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:simply_meet/screens/login_signUp/helperWidgets/InputWidgetAreaDelete.dart';

import '../LoginScreen.dart';

class SignUpBodyContent extends StatelessWidget {
  final Function toggleLoginSignUp;

  SignUpBodyContent({@required this.toggleLoginSignUp});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final myTheme = Theme.of(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterSwitch(
              value: false,
              onToggle: (bool invertedBoolean) =>
                  {toggleLoginSignUp(invertedBoolean)},
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.05,
              activeTextFontWeight: FontWeight.w500,
              inactiveTextFontWeight: FontWeight.w500 ,
              showOnOff: true,
              activeText: 'LOGIN',
              inactiveText: 'REGISTER',
              activeColor: myTheme.primaryColor,
              inactiveColor: Colors.black.withOpacity(0.35),
              activeIcon: Icon(Icons.login_rounded),
              inactiveIcon: Icon(Icons.create_rounded),
            ),
            SizedBox(height: screenSize.height * 0.03),
            Image.asset(
              "assets/images/signupImageFinal.png",
              height: screenSize.height * 0.25,
              fit: BoxFit.cover,
            ),
            InputWidgetAreaDelete(
              child: Column(
                children: [
                  InputWidgetDelete(
                    hintText: "Name",
                    leadingIcon: Icon(
                      Icons.person,
                      color: myTheme.primaryColor,
                    ),
                  ),
                  InputWidgetDelete(
                    hintText: "Email Address",
                    leadingIcon: Icon(
                      Icons.email_rounded,
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
                  InputWidgetDelete(
                    hintText: "Confirm Password",
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
          ],
        ),
        Positioned(
          child: ElevatedButton(
            child: Text(
              "SIGN UP",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(myTheme.primaryColor),
            ),
            onPressed: () =>
                Navigator.of(context).pushNamed(LoginScreen.routeName),
          ),
          bottom: screenSize.height * 0.095,
          width: screenSize.width * 0.3,
          height: screenSize.height * 0.055,
        ),
      ],
    );
  }
}
