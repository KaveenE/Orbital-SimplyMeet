import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreenPageBody extends StatelessWidget {
  final String imageURL;
  final String title1;
  final String title2;

  const WelcomeScreenPageBody({
    @required this.imageURL,
    @required this.title1,
    @required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacer(),
        Center(
            child: Opacity(
          opacity: 0.7,
          child: Lottie.asset(
            imageURL,
            fit: BoxFit.cover,
          ),
        )),
        Spacer(),
        Text(
          title1,
          style: myTheme.textTheme.headline2,
        ),
        //SizedBox(height: 15),
        Spacer(),

        Text(
          title2,
          style: myTheme.textTheme.bodyText1,
        ),

        Spacer(
          flex: 4,
        ),
      ],
    );
  }
}
