import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/flutterfire/authentication_service.dart';
import 'package:simply_meet/start/ui/views/forget_password.dart';
import 'package:simply_meet/start/ui/views/verfiy_email_view.dart';
import 'package:simply_meet/timetable/home_view.dart';
import 'package:simply_meet/start/ui/views/login_signup_view.dart';
import 'package:simply_meet/start/ui/views/welcome_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const MINIMAL_PURPLE = Color(0xff584191);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AuthenticationService()),
        StreamProvider<User?>(
          create: (context) =>
              context.read<AuthenticationService>().getAuthStateChanges(),
          initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SimplyMeet',
        theme: ThemeData(
          primaryColor: MINIMAL_PURPLE,
          scaffoldBackgroundColor: MINIMAL_PURPLE,
          backgroundColor: MINIMAL_PURPLE,
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
        ),
        routes: {
          '/': (_) => WelcomeView(),
          LoginSignupView.routeName: (_) => LoginSignupView(),
          VerifyEmailView.routeName: (_)=> VerifyEmailView(),
          ForgetPasswordView.routeName: (_) => ForgetPasswordView(),
          HomeView.routeName: (_) => HomeView(),
        },
      ),
    );
  }
}
