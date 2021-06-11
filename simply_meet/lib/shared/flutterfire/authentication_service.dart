import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


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
