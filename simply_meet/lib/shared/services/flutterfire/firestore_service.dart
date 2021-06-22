import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:simply_meet/shared/models/event.dart';
import 'package:simply_meet/shared/models/reminder.dart';

class FirestoreService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  final StreamController<List<Event>> _eventsController =
      StreamController<List<Event>>.broadcast();

  final StreamController<List<Reminder>> _remindersController =
      StreamController<List<Reminder>>.broadcast();

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
      
      await _timetableCollectionReference.add(event.toJson());
    } catch (e) {
      return (e is PlatformException) ? e.message : e.toString();
    }
  }

  Stream<List<Event>> getEventsRealTime() {
    //subscribes to stream and execute corresponding callback
    //In this case, i listen for new data and add onto my controller.
    //Controller then produces stream
    _timetableCollectionReference.snapshots().listen(
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
    debugPrint("close stream for events");
    await _eventsController.close();
  }

  Future<void> deleteEvent(String documentIDFireStore) async {
    await _timetableCollectionReference.doc(documentIDFireStore).delete();

    debugPrint("Deleted success on ${_firebaseAuth.currentUser!.uid}");
  }

  Future<String?> updateEvent(Event event) async {
    try {
      await _timetableCollectionReference
          .doc(event.documentIDFireStore)
          .set(event.toJson());
    } catch (e) {
      return (e is PlatformException) ? e.message : e.toString();
    }
  }

  CollectionReference<Object?> get _timetableCollectionReference {
    var timetableCollectionReference = _usersCollectionReference
        .doc(_firebaseAuth.currentUser!.uid)
        .collection("timetable");
    return timetableCollectionReference;
  }

  //Reminder related methods
  Future<String?> addReminder(Reminder reminder) async {
    try {
      await _todoCollectionReference.add(reminder.toJson());
    } catch (e) {
      return (e is PlatformException) ? e.message : e.toString();
    }
  }

  Stream<List<Reminder>> getRemindersRealTime() {
    //subscribes to stream and execute corresponding callback
    //In this case, i listen for new data and add onto my controller.
    //Controller then produces stream
    _todoCollectionReference.snapshots().listen(
      (reminderSnapShot) {
        if (reminderSnapShot.size >= 0) {
          final todoList = reminderSnapShot.docs
              .map((reminderDocSnapShot) => Reminder.fromJson(
                  reminderDocSnapShot.data() as Map<String, dynamic>,
                  reminderDocSnapShot.id))
              .toList();

          //Add the timetable onto the controller. We use this controller to produce the stream
          _remindersController.add(Reminder.deepCopyList(todoList));
        }
      },
    );

    return _remindersController.stream;
  }

  Future<void> stopListeningReminders() async {
    debugPrint("close stream for reminders");
    await _remindersController.close();
  }

  Future<void> deleteReminder(String documentIDFireStore) async {
    await _todoCollectionReference.doc(documentIDFireStore).delete();

    debugPrint("Deleted success on ${_firebaseAuth.currentUser!.uid}");
  }

  Future<String?> updateReminder(Reminder reminder) async {
    try {
      await _todoCollectionReference
          .doc(reminder.documentIDFireStore)
          .set(reminder.toJson());
    } catch (e) {
      return (e is PlatformException) ? e.message : e.toString();
    }
  }

  CollectionReference<Object?> get _todoCollectionReference {
    var todoCollectionReference = _usersCollectionReference
        .doc(_firebaseAuth.currentUser!.uid)
        .collection("todo");
    return todoCollectionReference;
  }
}
