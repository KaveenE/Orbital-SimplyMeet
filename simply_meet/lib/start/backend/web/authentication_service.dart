import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  static final AuthenticationService singleton = AuthenticationService();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late UserCredential _firebaseAuthResponse;

  //Errors thrown will be used for dialogs by view_model
  Future<bool> logIn({required String email, required String password}) async {
    try {
      _firebaseAuthResponse = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      //Means he's inside
      return _firebaseAuthResponse.user != null;

    } on FirebaseAuthException {
      rethrow;
    }
    catch (e) {
      //logging purposes
      print(e);
      rethrow;
    }
  }

  //Errors thrown will be used for dialogs by view_model
  Future<bool> signUp({required String email, required String password}) async {
    try {
      _firebaseAuthResponse = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      
      //Means he's inside
      return _firebaseAuthResponse.user != null;
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      //logging purposes
      print(e);
      rethrow;
    }
  }
}
