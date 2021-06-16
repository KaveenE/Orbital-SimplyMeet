import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:simply_meet/core/ui/views/tabs_all_views.dart';
import 'package:simply_meet/shared/view_models/loadable_model.dart';

class VerifyEmailViewModel extends LoadableModel {
  final BuildContext _context;

  VerifyEmailViewModel(this._context);

  Future<void> checkEmailVerified() async {
     Timer.periodic(Duration(seconds: 5), (timer) async {
      print("fuck");
      if (await _isVerified()) {
        timer.cancel();
        print("pushed");
        Navigator.of(_context).pushReplacementNamed(TabsAllViews.routeName);
      }
    });
  }

  Future<bool> _isVerified() async {
    //Call reload to retrieve latest info on user from Firebase
    //Allows for accurately checking of user related shit
    await super.currentUser!.reload();
    print(super.currentUser!.emailVerified);
    return super.currentUser!.emailVerified;
  }
}
