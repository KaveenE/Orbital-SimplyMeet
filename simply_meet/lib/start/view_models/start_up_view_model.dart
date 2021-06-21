import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/ui/views/tabs_all_views.dart';
import 'package:simply_meet/shared/utility/loader.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';
import 'package:simply_meet/start/ui/views/welcome_view.dart';

class StartUpViewModel {
  Future<Widget> redirectView(BuildContext context) {
    final userState = Provider.of<User?>(context, listen: false);

    return Future.delayed(
      Duration(seconds: 1),
      () {
        if (userState != null) {
          return TabsAllViews();
        }
        return WelcomeView();
      },
    );
    
  }

  Widget startUpView(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              'assets/images/logo_white.png',
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
            Loaders.singleton.cubeGrid(screenHeight(context) * 0.03)
          ],
        ),
      ),
    );
  }
}
