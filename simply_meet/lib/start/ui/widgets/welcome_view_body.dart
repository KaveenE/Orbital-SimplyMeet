import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class WelcomeViewBody extends StatelessWidget {
  final String imageURL;
  final String title1;
  final String title2;

  const WelcomeViewBody({
    required this.imageURL,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Spacer(),
          Center(
              child: Opacity(
            opacity: 0.7,
            child: Lottie.asset(
              imageURL,
              fit: BoxFit.cover,
            ),
          )),
          const Spacer(),
          Text(
            title1,
            style: theme(context).textTheme.headline2,
          ),
          const Spacer(),
          Text(
            title2,
            style: theme(context).textTheme.bodyText1,
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
