import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simply_meet/core/ui/views/tabs_all_views.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';


class VerifyEmailView extends StatefulWidget {
  static const routeName = '/verifyEmailView';

  const VerifyEmailView();

  @override
  _VerifyEmailViewState createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  /*final user = FirebaseAuth.instance.currentUser!;

  
  @override
  void initState() {
    super.initState();
    VerifyEmailViewModel(context).checkEmailVerified();
  }*/
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "'Hey ${user.displayName}! An email has been sent to ${user.email}. Please verify'",
              textAlign: TextAlign.center,
            ),
            verticalSpaceMedium,
            CircularProgressIndicator.adaptive(
              strokeWidth: 6,
              backgroundColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => TabsAllViews()));
    }
  }
}
