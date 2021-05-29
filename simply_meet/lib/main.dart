import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simply_meet/screens/Welcome/WelcomeScreen.dart';
import 'package:simply_meet/screens/login_signUp/LoginScreen.dart';
import 'package:simply_meet/screens/login_signUp/SignUpScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(new MyApp());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const MINIMAL_PURPLE = Color(0xff584191);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SimplyMeet',
      theme: ThemeData(
        primaryColor: MINIMAL_PURPLE,
        accentColor: Colors.white70,
        scaffoldBackgroundColor: MINIMAL_PURPLE,
        backgroundColor: MINIMAL_PURPLE,
        fontFamily: GoogleFonts.raleway().fontFamily,
        textTheme: ThemeData.light().textTheme.copyWith(
            headline2: GoogleFonts.raleway(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            bodyText1: GoogleFonts.raleway(
              color: Colors.white70,
              fontSize: 15,
            ),
            button: GoogleFonts.raleway(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 17,
            ),
            subtitle2: GoogleFonts.raleway(
              color: Colors.grey.shade800,
              decoration: TextDecoration.underline,
            ),
            subtitle1: GoogleFonts.raleway(
              color: Colors.grey.shade800,
            )),
      ),
      routes: {
        '/': (_) => WelcomeScreen(),
        NewLoginScreen.routeName: (_) => NewLoginScreen(),
        NewSignUpScreen.routeName: (_) => NewSignUpScreen(),
      },
    );
  }
}

