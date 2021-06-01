import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import '../SignUpScreen.dart';

class WordsBelowSignUpLogin extends StatelessWidget {
  final String text1;
  final String text2;
  final String route;

  const WordsBelowSignUpLogin({
    @required this.text1,
    @required this.text2,
    @required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);

    return RichText(
      text: TextSpan(
        text: text1,
        style: myTheme.textTheme.subtitle1,
        children: <TextSpan>[
          TextSpan(
            text: text2,
            style: myTheme.textTheme.subtitle2,
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.pushNamed(
                    context,
                    route,
                  ),
          ),
        ],
      ),
    );
  }
}
