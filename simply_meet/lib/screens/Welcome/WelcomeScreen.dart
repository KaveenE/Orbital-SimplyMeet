import 'package:flutter/material.dart';
import 'package:simply_meet/widgets/Body.dart';
import 'widgets/WelcomeBodyContent.dart';

/*
    TLDR: I really need your help for the aEsTheTics.

    There's actually like 1000s of way of using them to customize, 
    since they got numerous fields to initilize + BoxDecoration is only
    1 of the many subtypes of Decoration class so there's legit 1000s of way.

    What I'm doing is  the standard way,ie lame af. Therefore, I'm leaving this in your capable (unfortunately I can't bold this 
    to emphasize my sarcasm so you'll never know that I'm sarcastic. A pity indeed.) hands to showcase a realm of UI that no flutter
    developer has even imagined.

    With that said, if want to customize only with LinearGradient(yea there's other gradients) + dont wanna spend too much time,
    consider just playing with the colors list (can add more than 2 colors yo) and the begin and end coordinates (look at API).

    For Positioned widgets, watch the video by Google + just read API bah 
    or if your lazy just modify the numbers on what I wrote for the Positioned widgets.
    */

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // nivi, if u want to extract the primaryColor, accentColor, primaryColorDark
    // do myTheme.<propertyName>
    // Also you can go to the main file and play with the global theme data
    final myTheme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    final Decoration containerDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.purpleAccent.shade100,
          Colors.purple[50],
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );

    final List<Positioned> positionedWidgets = [
      Positioned(
        child: Image.asset(
          "assets/images/topRight.png",
          width: screenSize.width * 0.2,
        ),
        top: 0,
        right: -screenSize.width * 0.03,
      ),
      Positioned(
        child: Image.asset(
          "assets/images/bottomLeft.png",
          width: screenSize.width * 0.3,
        ),
        bottom: -screenSize.height * 0.01,
        left: -screenSize.width * 0.05,
      ),
    ];

    return Scaffold(
      body: Body(
        //containerDecoration: containerDecoration,
        positionedWidgets: positionedWidgets,
        child: WelcomeBodyContent(),
      ),
    );
  }
}
