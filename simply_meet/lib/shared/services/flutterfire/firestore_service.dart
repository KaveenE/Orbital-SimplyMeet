import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:simply_meet/shared/models/event.dart';
import 'package:simply_meet/shared/models/task.dart';

class FirestoreService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  final StreamController<List<Event>> _eventsController =
      StreamController<List<Event>>.broadcast();

  final StreamController<List<Task>> _tasksController =
      StreamController<List<Task>>.broadcast();

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
  Future<String?> addTask(Task task) async {
    try {
      await _todoCollectionReference.add(task.toJson());
    } catch (e) {
      return (e is PlatformException) ? e.message : e.toString();
    }
  }

  Stream<List<Task>> getTasksRealTime() {
    //subscribes to stream and execute corresponding callback
    //In this case, i listen for new data and add onto my controller.
    //Controller then produces stream
    _todoCollectionReference.snapshots().listen(
      (taskSnapShot) {
        if (taskSnapShot.size >= 0) {
          final todoList = taskSnapShot.docs
              .map((taskDocSnapShot) => Task.fromJson(
                  taskDocSnapShot.data() as Map<String, dynamic>,
                  taskDocSnapShot.id))
              .toList();

          //Add the timetable onto the controller. We use this controller to produce the stream
          _tasksController.add(Task.deepCopyList(todoList));
        }
      },
    );

    return _tasksController.stream;
  }

  Future<void> stopListeningTasks() async {
    debugPrint("close stream for task");
    await _tasksController.close();
  }

  Future<void> deleteTask(String documentIDFireStore) async {
    await _todoCollectionReference.doc(documentIDFireStore).delete();

    debugPrint("Deleted success on ${_firebaseAuth.currentUser!.uid}");
  }

  Future<String?> updateTask(Task task) async {
    try {
      await _todoCollectionReference
          .doc(task.documentIDFireStore)
          .set(task.toJson());
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
