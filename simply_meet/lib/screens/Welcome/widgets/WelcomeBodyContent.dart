import 'package:flutter/material.dart';
import 'package:simply_meet/screens/login_signUp/LoginSignUpScreen.dart';




class WelcomeBodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final myTheme = Theme.of(context);
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text(
          "WELCOME",
          style: myTheme.textTheme.headline6.copyWith(
            fontSize: 25,
            color: myTheme.primaryColor,
          ),
          textAlign: TextAlign.end,
        ),
        SizedBox(height: screenSize.height * 0.03),
        Image.asset("assets/images/finalLogoWithTitle.png",
            width: screenSize.width * 0.8),
        //SizedBox(height: screenSize.height *  ),
        IconButton(
          iconSize: screenSize.width * 0.25,
          icon: Icon(
            Icons.navigate_next_rounded,
            color: myTheme.primaryColor,
          ),
          onPressed: () => Navigator.of(context).pushNamed(LoginSignUpScreen.routeName),
        ),
      ],
    );
  }
}
