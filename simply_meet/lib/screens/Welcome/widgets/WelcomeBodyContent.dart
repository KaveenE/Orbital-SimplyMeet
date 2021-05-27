import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simply_meet/screens/login_signUp/LoginSignUpScreen.dart';

class WelcomeBodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final myTheme = Theme.of(context);

    return Container(
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () => print('Skip'),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Raleway'),
                    )),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );

    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Text(
    //       "WELCOME",
    //       style: myTheme.textTheme.headline6.copyWith(
    //         fontSize: 25,
    //         color: myTheme.primaryColor,
    //       ),
    //       textAlign: TextAlign.end,
    //     ),
    //     SizedBox(height: screenSize.height * 0.03),
    //     Image.asset("assets/images/finalLogoWithTitle.png",
    //         width: screenSize.width * 0.8),
    //     IconButton(
    //       // use this for next botton
    //       iconSize: screenSize.width * 0.25,
    //       icon: Icon(
    //         Icons.navigate_next_rounded,
    //         color: myTheme.primaryColor,
    //       ),
    //       onPressed: () =>
    //           Navigator.of(context).pushNamed(LoginSignUpScreen.routeName),
    //     ),
    //   ],
    // );
  }
}
