import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> logIn({
    required String email,
    required String password,
  }) async {
    return await _standardTryCatchLogic(
        someFirebaseAuthMethod: _firebaseAuth.signInWithEmailAndPassword,
        email: email,
        password: password);
  }

  Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    return await _standardTryCatchLogic(
        someFirebaseAuthMethod: _firebaseAuth.createUserWithEmailAndPassword,
        email: email,
        password: password);
  }

  Future<String?> logOut() async {
    _firebaseAuth.signOut();
  }

  Future<String?> sendPasswordResetEmail({required String email}) async {
    return await _standardTryCatchLogic(
      someFirebaseAuthMethod: _firebaseAuth.sendPasswordResetEmail,
      email: email,
    );
  }

  Future<String?> _standardTryCatchLogic({
    required Function someFirebaseAuthMethod,
    String? email,
    String? password,
  }) async {
    try {
      if (password == null) {
        await someFirebaseAuthMethod(email: email);
      } else {
        await someFirebaseAuthMethod(email: email, password: password);
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    } on SocketException {
      return "There is no Internet Connection";
    } catch (e) {
      print("Exception generated in AuthenticationService class. " +
          e.toString());
      return "Please try again";
    }
  }

  Stream<User?> getAuthStateChanges() => _firebaseAuth.authStateChanges();
}
