import 'package:flutter/material.dart';

// Combine Login & Singup Button

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key key,
    @required this.myTheme,
  }) : super(key: key);

  final ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            primary: myTheme.primaryColor,
            padding: EdgeInsets.symmetric(vertical: 10),
            textStyle: TextStyle(
                fontSize: 17,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w800)),
        onPressed: () {},
        child: Text("Sign up"),
      ),
    );
  }
}
