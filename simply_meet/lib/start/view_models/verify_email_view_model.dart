import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:simply_meet/shared/view_models/loadable_model.dart';
import 'package:simply_meet/timetable/home_view.dart';

class VerifyEmailViewModel extends LoadableModel {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final BuildContext _context;
  VerifyEmailViewModel(this._context);

  Future<void> checkEmailVerified() async {
    await Timer.periodic(Duration(seconds: 2), (timer) async {
      if (await _isVerified()) {
        
        timer.cancel();
        Navigator.of(_context).pushReplacementNamed(HomeView.routeName);
      }
    });
  }

  Future<bool> _isVerified() async {
    final user = _firebaseAuth.currentUser;

    //Call reload to retrieve latest info on user from Firebase
    //Allows for accurately checking of user related shit
    await user!.reload();

    return user.emailVerified;
  }
}
