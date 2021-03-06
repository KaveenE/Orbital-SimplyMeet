import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/ui/widgets/DrawerItem.dart';
import 'package:simply_meet/core/view_models/drawer_viewmodel.dart';
import 'package:simply_meet/shared/services/flutterfire/authentication_service.dart';
import 'package:simply_meet/shared/utility/themes.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawerViewModel = Provider.of<DrawerViewModel>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final auth = Provider.of<AuthenticationService>(context, listen: false);
    return Theme(
      data: themeProvider.themeType,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: screenHeight(context) * 0.1,
              color: theme(context).accentColor,
              child: Center(
                child: Text(
                  "Welcome, ${auth.currentUser()!.displayName}!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: theme(context).primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight(context) * 0.025),
            DrawerItem(
              icon: drawerViewModel.iconBasedOnMode,
              heading: drawerViewModel.headingBasedOnMode,
              tapHandler: drawerViewModel.toggleMode,
              currBoolean: drawerViewModel.islightMode,
              currTheme: themeProvider.themeType,
              context: context,
              activeColor: Colors.amber.shade400,
              inactiveThumbColor: Colors.grey.shade700,
            ),
            DrawerItem(
              icon: Icon(
                Icons.exit_to_app_rounded,
                color: theme(context).primaryColor,
              ),
              heading: "Log out",
              currTheme: themeProvider.themeType,
              tapHandler: () => drawerViewModel.logOut(context),
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}
