import 'package:flutter/material.dart';

import 'package:simply_meet/screens/Welcome/widgets/WelcomeScreenPageBody.dart';

class WelcomeScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
      child: const WelcomeScreenPageBody(
        imageURL: "assets/animations/TwoPeopleTalking.json",
        title1: "Privacy guaranteed",
        title2:
            "You can choose to keep certain events private so you can keep your private life seperate from school life!",
      ),
    );
  }
}
