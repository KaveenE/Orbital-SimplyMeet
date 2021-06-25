import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/ui/views/tabs_all_views.dart';
import 'package:simply_meet/shared/services/flutterfire/firestore_service.dart';

import 'package:simply_meet/start/ui/views/forget_password.dart';
import 'package:simply_meet/start/ui/views/verify_email_view.dart';
import 'package:simply_meet/start/ui/views/login_signup_view.dart';
import 'package:simply_meet/start/ui/views/welcome_view.dart';

import 'core/ui/views/create_edit_event_view.dart';
import 'shared/services/flutterfire/authentication_service.dart';

// TO-DO: For start screens, implement email address change?

const MINIMAL_PURPLE = Color(0xff584191);
const ACCENT_PURPLE = Color(0xffd696d0);

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
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AuthenticationService()),
        StreamProvider<User?>(
          create: (context) =>
              context.read<AuthenticationService>().getAuthStateChanges(),
          initialData: null,
        ),
        Provider(
          create: (_) => FirestoreService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SimplyMeet',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: MINIMAL_PURPLE,
          scaffoldBackgroundColor: MINIMAL_PURPLE,
          backgroundColor: MINIMAL_PURPLE,
          accentColor: ACCENT_PURPLE, // accent color has been deprecated
          errorColor: Colors.red[700],
          fontFamily: GoogleFonts.raleway().fontFamily,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: GoogleFonts.raleway(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w600),
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
          WelcomeView.routeName: (_) => WelcomeView(),
          LoginSignupView.routeName: (_) => LoginSignupView(),
          VerifyEmailView.routeName: (_) => VerifyEmailView(),
          ForgetPasswordView.routeName: (_) => ForgetPasswordView(),
          TabsAllViews.routeName: (_) => TabsAllViews(),
          CreateEditEventView.routeName: (_) => CreateEditEventView(),
        },
        navigatorObservers: [NavigationHistoryObserver()],
      ),
    );
  }
}
