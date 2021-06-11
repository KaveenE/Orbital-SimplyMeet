import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  static final AuthenticationService _singleton = AuthenticationService._();
  static AuthenticationService get singleton => _singleton;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthenticationService._();

  Future<String?> logIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    } on SocketException {
      return "There is no Internet Connection";
    } catch (e) {
      print("Exception generated in AuthenticationService class. "+ e.toString());
      return "Please try again";
    }
  }

  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    } on SocketException {
      return "There is no Internet Connection";
    } catch (e) {
      print("Exception generated in AuthenticationService class. "+ e.toString());
      return "Please try again";
    }
  }

  Future<void> logOut() async {
    _firebaseAuth.signOut();
  }

  Stream<User?> getAuthStateChanges() => _firebaseAuth.authStateChanges();
}
