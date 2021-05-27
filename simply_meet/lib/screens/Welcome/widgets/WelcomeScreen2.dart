import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({
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
                child: Lottie.asset("assets/animations/GirlWorking.json",
                    width: screenSize.width * 0.9),
              )),
              SizedBox(height: 30),
              Text(
                "Schedule events",
                style: myTheme.textTheme.headline2,
              ),
              SizedBox(height: 15),
              Text(
                "Keep track of your timetable as well as events in your calendar",
                style: myTheme.textTheme.bodyText1,
              )
            ]));
  }
}
