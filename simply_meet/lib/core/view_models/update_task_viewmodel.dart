import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/models/task.dart';
import 'package:simply_meet/shared/services/flutterfire/firestore_service.dart';
import 'package:simply_meet/shared/services/local_notif.dart';
import 'package:simply_meet/shared/utility/dialog_manager.dart';

class UpdateTaskViewModel {
  static final dialogManager = DialogManager.singleton;

  static void showConfirmationDialog(BuildContext context, Task task) {
    dialogManager.defaultConfirmationDialog(
      title: "Delete Task?",
      description: "Are you sure",
      context: context,
      confirmAction: () async =>
          await Provider.of<FirestoreService>(context, listen: false)
              .deleteTask(task.documentIDFireStore!)
              .then(
                (_) => UpdateTaskViewModel._deleteNotif(task),
              ),
    )..show();
  }

  static Future<void> _deleteNotif(Task task) {
    return LocalNotification.singleton
        .cancelNotification(task.notifID.hashCode);
  }
}