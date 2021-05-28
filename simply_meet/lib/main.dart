import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simply_meet/screens/Welcome/WelcomeScreen.dart';
import 'package:simply_meet/screens/login_signUp/NewLoginScreen.dart';

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
        primaryColor: MINIMAL_PURPLE  ,
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
            ),
            
      ),
      routes: {
        '/': (_) => WelcomeScreen(),
        NewLoginScreen.routeName: (_) => NewLoginScreen(),
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
/*
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SimplyMeet',
      home: MyPageView(),
    );
  }
}

class MyPageView extends StatefulWidget {
  const MyPageView();

  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_pageController.hasClients) {
                      _pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: const Text('Next'),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_pageController.hasClients) {
                      _pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: const Text('Previous'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
