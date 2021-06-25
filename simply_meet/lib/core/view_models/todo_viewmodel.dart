import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:simply_meet/core/ui/views/update_task_view.dart';
import 'package:simply_meet/core/ui/widgets/floating_bottom_modal.dart';
import 'package:simply_meet/shared/models/task.dart';
import 'package:simply_meet/shared/services/flutterfire/firestore_service.dart';
import 'package:simply_meet/shared/services/local_notif.dart';
import 'package:simply_meet/shared/utility/dialog_manager.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';
import 'package:simply_meet/shared/view_models/loadable_model.dart';

class ToDoViewModel extends LoadableModel {
  final _dialogManager = DialogManager.singleton;
  final _localNotif = LocalNotification.singleton;
  DateTime get currTime => DateTime.now();

  Widget buildTask(Task someTask, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              someTask.title,
              style: TextStyle(
                  fontSize: 18, decoration: _finishTaskDecoration(someTask)),
            ),
            subtitle: Text(
              '${DateFormat("d/M/y").add_jm().format(someTask.date)} • ${someTask.priority}',
              style: TextStyle(
                  fontSize: 15, decoration: _finishTaskDecoration(someTask)),
            ),
            trailing: Checkbox(
              onChanged: (newBool) async {
                final firestore =
                    Provider.of<FirestoreService>(context, listen: false);
                super.setBusy(true);

                await _localNotif.cancelNotification(someTask.notifID.hashCode);
                final response = await firestore
                    .updateTask(someTask.copyWith(completionStatus: newBool));

                if (!newBool!) {
                  _scheduleNotification(someTask, context);
                }

                super.setBusy(false);

                if (response != null) {
                  _dialogManager.defaultErrorDialog(
                      title: "Failed to update task",
                      description: response,
                      context: context)
                    ..show();
                }
              },
              activeColor: theme(context).accentColor,
              value: someTask.completionStatus,
            ),
            onTap: () async => await showFloatingModalBottomSheet(
              context: context,
              builder: (_) => UpdateTaskView(
                task: someTask,
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  static TextDecoration _finishTaskDecoration(Task someTask) {
    return someTask.completionStatus
        ? TextDecoration.lineThrough
        : TextDecoration.none;
  }

  static int completedTasks(List<Task> taskList) {
    return taskList
        .where((task) => task.completionStatus == true)
        .fold(0, (int previousValue, _) => previousValue + 1);
  }

  Future<void> _scheduleNotification(Task task, BuildContext context) async {
    var scheduledTimingForNotif = task.date.isBefore(currTime)
        ? currTime.add(Duration(seconds: 20))
        : task.date;

    return await _localNotif.scheduledNotification(
      context: context,
      notifID: task.notifID!,
      subject: task.title,
      scheduledDate: scheduledTimingForNotif,
    );
  }
}
