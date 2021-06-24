import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/models/event.dart';
import 'package:simply_meet/shared/services/flutterfire/firestore_service.dart';
import 'package:simply_meet/shared/services/local_notif.dart';
import 'package:simply_meet/shared/utility/dialog_manager.dart';

class UpdateEventViewModel {
  static final dialogManager = DialogManager.singleton;

  static void showConfirmationDialog(BuildContext context, Event event) {
    dialogManager.defaultConfirmationDialog(
      title: "Delete Event?",
      description: "Are you sure",
      context: context,
      confirmAction: () async =>
          await Provider.of<FirestoreService>(context, listen: false)
              .deleteEvent(event.documentIDFireStore!)
              .then(
                (_) => UpdateEventViewModel._deleteNotif(event),
              ),
    )..show();
  }

  static Future<void> _deleteNotif(Event event) {
    return LocalNotification.singleton
        .cancelNotification(event.notifID.hashCode);
  }
}
