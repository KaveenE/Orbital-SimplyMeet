import 'package:flutter/material.dart';
import 'widgets/WelcomeScreenPageBody.dart';



class WelcomeScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
      child: const WelcomeScreenPageBody(
        imageURL: "assets/animations/BoyWithLaptop.json",
        title1: "Generate timings",
        title2: "Find optimal time for project meetings without a hassle",
      ),
    );
  }
}
