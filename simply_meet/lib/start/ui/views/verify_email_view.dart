import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/services/flutterfire/authentication_service.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';
import 'package:simply_meet/start/view_models/verify_email_view_model.dart';

class VerifyEmailView extends StatefulWidget {
  static const routeName = '/verifyEmailView';

  const VerifyEmailView();

  @override
  _VerifyEmailViewState createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    VerifyEmailViewModel(context).checkEmailVerified();
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
}
