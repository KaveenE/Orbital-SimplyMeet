import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:simply_meet/shared/models/event.dart';

class FirestoreService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  final StreamController<List<Event>> _eventsController =
      StreamController<List<Event>>.broadcast();

  // //User related methods. Not getting user is a 1-time read. No point using real-time read.
  // Future<String?> createUser(User user) async {
  //   try {
  //     await _usersCollectionReference.doc(user.uid).set(user.toJson());
  //   } catch (e) {
  //     return (e is PlatformException) ? e.message : e.toString();
  //   }
  // }

  // Future getUser(String uid) async {
  //   try {
  //     final userDocSnapShot = await _usersCollectionReference.doc(uid).get();
  //     return User.fromJson(userDocSnapShot.data() as Map<String, dynamic>);
  //   } catch (e) {
  //     return (e is PlatformException) ? e.message : e.toString();
  //   }
  // }

  //Event related methods
  Future<String?> addEvent(Event event) async {
    try {
      //_eventsCollectionReference.
      await _eventsCollectionReference.add(event.toJson());
    } catch (e) {
      return (e is PlatformException) ? e.message : e.toString();
    }
  }

  Stream<List<Event>> getEventsRealTime() {
    //subscribes to stream and execute corresponding callback
    //In this case, i listen for new data and add onto my controller.
    //Controller then produces stream
    _eventsCollectionReference.snapshots().listen(
      (eventsSnapshot) {
        if (eventsSnapshot.size >= 0) {
          final timetable = eventsSnapshot.docs
              .map((eventDocSnapShot) => Event.fromJson(
                  eventDocSnapShot.data() as Map<String, dynamic>,
                  eventDocSnapShot.id))
              .toList();

          //Add the timetable onto the controller. We use this controller to produce the stream
          _eventsController.add(Event.deepCopyList(timetable));
        }
      },
    );

    return _eventsController.stream;
  }

  Future<void> stopListeningEvents() async {
    debugPrint("close stream");
    await _eventsController.close();
  }

  Future<void> deleteEvent(String documentIDFireStore) async {
    await _eventsCollectionReference.doc(documentIDFireStore).delete();

    debugPrint("Deleted success on ${_firebaseAuth.currentUser!.uid}");
  }

  Future<String?> updateEvent(Event event) async {
    try {
      await _eventsCollectionReference
          .doc(event.documentIDFireStore)
          .set(event.toJson());
    } catch (e) {
      return (e is PlatformException) ? e.message : e.toString();
    }
  }

  CollectionReference<Object?> get _eventsCollectionReference {
    var eventsCollectionReference = _usersCollectionReference
        .doc(_firebaseAuth.currentUser!.uid)
        .collection("timetable");
    return eventsCollectionReference;
  }
}
