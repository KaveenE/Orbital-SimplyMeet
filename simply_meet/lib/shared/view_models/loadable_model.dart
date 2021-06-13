import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:simply_meet/shared/services/flutterfire/authentication_service.dart';

class LoadableModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  //Going forward, we'll be calling our user in many of our view and thus view models.
  //Thus delegate retrieval of user here via FireBaseAut(we'll not use the one stored in Provider as it requires context)
  static final _user = AuthenticationService().currentUser();
  User? get currentUser => _user;
}
