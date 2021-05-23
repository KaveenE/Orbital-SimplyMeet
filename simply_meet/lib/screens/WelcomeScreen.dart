import 'package:flutter/material.dart';
import 'package:simply_meet/widgets/WelcomeBackground.dart';
import 'package:simply_meet/widgets/WelcomeBody.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeBackground(
        child: WelcomeBody(),
      ),
    );
  }
}
