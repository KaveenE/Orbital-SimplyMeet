import 'package:flutter/material.dart';
import 'widgets/WelcomeScreenPageBody.dart';


class WelcomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
      child: const WelcomeScreenPageBody(
        imageURL: "assets/animations/GirlWorking.json",
        title1: "Schedule events",
        title2:
            "Keep track of your timetable as well as events in your calendar",
      ),
    );
  }
}
