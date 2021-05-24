import 'package:flutter/material.dart';

import '../../widgets/Body.dart';
import './widgets/LoginBodyContent.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/loginScreen";
  final Function toggleLoginSignUp;

  const LoginScreen({@required this.toggleLoginSignUp});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(
        child: LoginBodyContent(
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
          ),
        ],
        containerDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purpleAccent.shade100,
              Colors.purple[50],
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
