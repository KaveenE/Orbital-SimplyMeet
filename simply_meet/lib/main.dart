import 'package:flutter/material.dart';
import 'package:simply_meet/screens/Welcome/NewWelcomeScreen.dart';
import 'package:simply_meet/screens/Login_SignUp/LoginSignUpScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final minimalPurple = Color(0xff584191);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SimplyMeet',
      theme: ThemeData(
          primaryColor: minimalPurple,
          scaffoldBackgroundColor: minimalPurple,
          backgroundColor: minimalPurple,
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
                headline2: TextStyle(
                  color: Colors.white70,
                  fontFamily: 'Raleway-Bold',
                  fontSize: 30,
                ),
                bodyText1: TextStyle(
                  color: Colors.white70,
                  fontFamily: 'Raleway',
                  fontSize: 15,
                ),
                button: TextStyle(
                    fontSize: 17,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              )),
      home: NewWelcomeScreen(),
      routes: {
        LoginSignUpScreen.routeName: (_) => LoginSignUpScreen(),
      },
    );
  }
}

// Kaveen's Code
// import 'package:flutter/material.dart';
// import 'package:simply_meet/screens/Welcome/NewWelcomeScreen.dart';
// //import 'package:dcdg/dcdg.dart';
// //import './screens/Welcome/WelcomeScreen.dart';
// import 'screens/login_signUp/LoginSignUpScreen.dart';
// void main() {
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'SimplyMeet',
//       theme: ThemeData(
//         primaryColor: Colors.purple,
//         accentColor: Colors.purple.withOpacity(0.4),
//         primaryColorDark: Colors.purple[900],
//         scaffoldBackgroundColor: Color.fromRGBO(255, 254, 229, 1),
//         fontFamily: "Raleway",
//         textTheme: ThemeData.light().textTheme.copyWith(
//             headline6: TextStyle(
//               fontSize: 20,
//               fontFamily: "RobotoCondensed",
//               fontWeight: FontWeight.bold,
//             ),
//             bodyText2: TextStyle(
//               color: Colors.grey[850],
//             ),
//             bodyText1: TextStyle(
//               color: Colors.grey[850],
//             ),
//             button: TextStyle(
//               color: Colors.grey[850],
//               fontFamily: "RobotoCondensed",
//             )),
//       ),
//       home: NewWelcomeScreen(),
//       routes: {
//         LoginSignUpScreen.routeName: (_) => LoginSignUpScreen(),
//       },
//     );
//   }
// }
