import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/ui/views/tabs_all_views.dart';
import 'package:simply_meet/start/ui/views/welcome_view.dart';

class Redirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<User?>(context, listen: false);

    return userState == null ? WelcomeView() : TabsAllViews();
  }
}
