import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/ui/widgets/DrawerItem.dart';
import 'package:simply_meet/core/view_models/drawer_viewmodel.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawerViewModel = Provider.of<DrawerViewModel>(context);

    return Drawer(
      child: ListView(
        children: [
          Container(
            height: screenHeight(context) * 0.2,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Center(
              child: Text(
                "User profile. Directs to profile page. Showcase email,username, function to update e-mail/password",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DrawerItem(
            icon: drawerViewModel.iconBasedOnMode,
            heading: drawerViewModel.headingBasedOnMode,
            tapHandler: drawerViewModel.toggleMode,
            currBoolean: drawerViewModel.islightMode,
            context: context,
          ),
          DrawerItem(
            icon: Icon(Icons.logout),
            heading: "Log out",
            tapHandler: () => drawerViewModel.logOut(context),
            context: context,
          ),
        ],
      ),
    );
  }
}
