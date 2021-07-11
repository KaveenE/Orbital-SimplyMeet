import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  var themeType = MyThemes.lightTheme;

  void toggleTheme(bool isLight) {
    themeType = !isLight ? MyThemes.darkTheme : MyThemes.lightTheme;
    super.notifyListeners();
  }
}

class MyThemes {
  static const MINIMAL_PURPLE = Color(0xff584191);
  static const ACCENT_PURPLE = Color(0xffd1c2f2);

  static final lightTheme = ThemeData(
    primarySwatch: Colors.purple,
    primaryColor: MINIMAL_PURPLE,
    scaffoldBackgroundColor: MINIMAL_PURPLE,
    backgroundColor: Colors.white,
    accentColor: ACCENT_PURPLE,
    errorColor: Colors.red[700],
    fontFamily: GoogleFonts.raleway().fontFamily,
    textTheme: ThemeData.light().textTheme.copyWith(
          headline2: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
          bodyText1: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 15,
          ),
          bodyText2: GoogleFonts.raleway(
            fontSize: 15,
          ),
          button: GoogleFonts.raleway(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
          subtitle1: GoogleFonts.raleway(
            color: Colors.grey.shade800,
          ),
          subtitle2: GoogleFonts.raleway(
            color: Colors.grey.shade800,
            decoration: TextDecoration.underline,
          ),
        ),
  );

  static final darkTheme = lightTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[900],
    backgroundColor: Colors.grey[900],
    canvasColor: Colors.grey[900],
  );
}
