import 'package:flutter/material.dart';
import 'package:simply_meet/screens/LoginScreen.dart';
import 'package:simply_meet/screens/WelcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SimplyMeet',
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.purple.withOpacity(0.4),
        primaryColorDark: Colors.purple[900],
        scaffoldBackgroundColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
              bodyText2: TextStyle(
                color: Colors.grey[850],
              ),
              bodyText1: TextStyle(
                color: Colors.grey[850],
              ),
            ),
      ),
      home: WelcomeScreen(),
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
      },
    );
  }
}
