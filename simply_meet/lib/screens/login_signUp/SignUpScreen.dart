import 'package:flutter/material.dart';
import 'package:simply_meet/screens/login_signUp/widgets/SignUpBodyContent.dart';
import 'package:simply_meet/widgets/Body.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = "/loginScreen";
  final Function toggleLoginSignUp;

  const SignUpScreen({@required this.toggleLoginSignUp});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(
        child: SignUpBodyContent(
          toggleLoginSignUp: toggleLoginSignUp,
        ),
        positionedWidgets: [
          Positioned(
            child: Image.asset(
              "assets/images/randSide2.png",
              width: screenSize.width * 0.2,
            ),
            top: -screenSize.height * 0.01,
            left: -screenSize.width * 0.01,
          ),
          Positioned(
            child: Image.asset(
              "assets/images/randomSide.png",
              width: screenSize.width * 0.2,
            ),
            bottom: -screenSize.height * 0.01,
            right: 0,
            width: screenSize.width * 0.15,
          ),
        ],
        // containerDecoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       Colors.purpleAccent.shade100,
        //       Colors.purple[50],
        //     ],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //   ),
        // ),
      ),
    );
  }
}
