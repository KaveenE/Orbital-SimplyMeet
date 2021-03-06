import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/services/flutterfire/authentication_service.dart';
import 'package:simply_meet/shared/utility/dialog_manager.dart';
import 'package:simply_meet/shared/utility/themes.dart';
import 'package:simply_meet/start/ui/views/login_signup_view.dart';

class DrawerViewModel extends ChangeNotifier {
 

  bool _lightMode = true;
  void toggleMode(bool invertedBool, BuildContext   context) {
    debugPrint(invertedBool.toString());
    Provider.of<ThemeProvider>(context, listen: false)
        .toggleTheme(invertedBool);

    _lightMode = invertedBool;
   
  }

  bool get islightMode => _lightMode;
  String get headingBasedOnMode => _lightMode ? "Light Mode" : "Night Mode";
  Icon get iconBasedOnMode => _lightMode
      ? Icon(Icons.wb_sunny_rounded, color: Colors.amber.shade400)
      : Icon(Icons.dark_mode_rounded, color: Colors.white);

  DrawerViewModel();

  void logOut(BuildContext context) async {
    final fireAuth = Provider.of<AuthenticationService>(context, listen: false);
    final response = await fireAuth.logOut(context);
    final dialogManager = DialogManager.singleton;

    if (response == null) {
      dialogManager.defaultSuccessDialog(
        title: "Successfully logged out",
        description: "",
        context: context,
      )..show().then((_) {
          debugPrint("Popped to default login page");
          return Navigator.popUntil(
            context,
            ModalRoute.withName(LoginSignupView.routeName),
          );
        });
    } else {
      dialogManager.defaultErrorDialog(
        title: "Unable to log out",
        description: "Please try again",
        context: context,
      )..show();
    }
  }
}
