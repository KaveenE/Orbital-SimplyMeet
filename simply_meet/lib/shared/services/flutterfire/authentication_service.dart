import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/services/flutterfire/firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> logIn({
    required String email,
    required String password,
  }) async {
    return await _standardTryCatchLogic(
      someFirebaseAuthMethod: _firebaseAuth.signInWithEmailAndPassword,
      email: email,
      password: password,
    );
  }

  Future<String?> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    return await _standardTryCatchLogic(
      someFirebaseAuthMethod: _firebaseAuth.createUserWithEmailAndPassword,
      email: email,
      password: password,
      username: username,
    );

  }

  Future<String?> logOut(BuildContext context) async {
    debugPrint("sign out loading");
      try {
          await Provider.of<FirestoreService>(context, listen: false)
          .stopListeningEvents();
          await _firebaseAuth.signOut();
      }
      catch (e) {
      return (e is PlatformException) ? e.message : e.toString();
    }
    debugPrint("sign out success");
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
    String? username,
  }) async {
    try {
      if (password == null) {
        await someFirebaseAuthMethod(email: email);
      } else if (username == null) {
        await someFirebaseAuthMethod(email: email, password: password);
      } else {
        final userCredential =
            await someFirebaseAuthMethod(email: email, password: password);
        await userCredential.user!.updateDisplayName(username);
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

  User? currentUser() => _firebaseAuth.currentUser;
  Stream<User?> getAuthStateChanges() => _firebaseAuth.authStateChanges();
}
