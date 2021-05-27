import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen3 extends StatelessWidget {
  const WelcomeScreen3({
    Key key,
    @required this.screenSize,
    @required this.myTheme,
  }) : super(key: key);

  final Size screenSize;
  final ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Center(
                  child: Opacity(
                opacity: 0.7,
                child: Lottie.asset("assets/animations/TwoPeopleTalking.json",
                    width: screenSize.width * 0.9),
              )),
              SizedBox(height: 30),
              Text(
                "Privacy guaranteed",
                style: myTheme.textTheme.headline2,
              ),
              SizedBox(height: 15),
              Text(
                "You can choose to keep certain events private so you can keep your private life seperate from school life!",
                style: myTheme.textTheme.bodyText1,
              )
            ]));
  }
}
