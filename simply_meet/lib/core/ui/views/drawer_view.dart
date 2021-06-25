import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/ui/widgets/DrawerItem.dart';
import 'package:simply_meet/core/view_models/drawer_viewmodel.dart';
import 'package:simply_meet/shared/utility/themes.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawerViewModel = Provider.of<DrawerViewModel>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Theme(
      data: themeProvider.themeType,
      child: Drawer(
        child: ListView(
          children: [
            Container(
              height: screenHeight(context) * 0.25,
              width: double.infinity,
              color: Theme.of(context).accentColor,
              child: Center(
                child: Text(
                  "User profile. Directs to profile page. Showcase email,username, function to update e-mail/password",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            DrawerItem(
              icon: drawerViewModel.iconBasedOnMode,
              heading: drawerViewModel.headingBasedOnMode,
              tapHandler: drawerViewModel.toggleMode,
              currBoolean: drawerViewModel.islightMode,
              context: context,
            ),
            DrawerItem(
              icon: Icon(Icons.exit_to_app_rounded,color: theme(context).primaryColor,),
              heading: "Log out",
              tapHandler: () => drawerViewModel.logOut(context),
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}
