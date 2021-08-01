import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/ui/views/add_tasks_view.dart';
import 'package:simply_meet/core/ui/views/todo_view.dart';
import 'package:simply_meet/core/ui/views/tabs_all_views.dart';
import 'package:simply_meet/shared/services/flutterfire/firestore_service.dart';
import 'package:simply_meet/shared/utility/themes.dart';

import 'package:simply_meet/start/ui/views/forget_password.dart';
import 'package:simply_meet/start/ui/views/verify_email_view.dart';
import 'package:simply_meet/start/ui/views/login_signup_view.dart';
import 'package:simply_meet/start/ui/views/welcome_view.dart';

import 'core/ui/views/create_edit_event_view.dart';
import 'core/view_models/sortfilter_viewmodel.dart';
import 'shared/services/flutterfire/authentication_service.dart';


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
        ChangeNotifierProvider(
          create: (_) => SortFilterViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SimplyMeet',
        theme: MyThemes.lightTheme,
        routes: {
          '/': (_) => WelcomeView(),
          WelcomeView.routeName: (_) => WelcomeView(),
          LoginSignupView.routeName: (_) => LoginSignupView(),
          VerifyEmailView.routeName: (_) => VerifyEmailView(),
          ForgetPasswordView.routeName: (_) => ForgetPasswordView(),
          TabsAllViews.routeName: (_) => TabsAllViews(),
          CreateEditEventView.routeName: (_) => CreateEditEventView(),
          ToDoView.routeName: (_) => ToDoView(),
          AddTaskView.routeName: (_) => AddTaskView(),
        },
        navigatorObservers: [NavigationHistoryObserver()],
      ),
    );
  }
}
