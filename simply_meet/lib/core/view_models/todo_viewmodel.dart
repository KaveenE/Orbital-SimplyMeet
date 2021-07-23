import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:simply_meet/core/ui/views/update_task_view.dart';
import 'package:simply_meet/core/ui/widgets/custom_divider.dart';
import 'package:simply_meet/core/ui/widgets/floating_bottom_modal.dart';
import 'package:simply_meet/core/view_models/sortfilter_viewmodel.dart';
import 'package:simply_meet/shared/models/task.dart';
import 'package:simply_meet/shared/services/flutterfire/firestore_service.dart';
import 'package:simply_meet/shared/services/local_notif.dart';
import 'package:simply_meet/shared/utility/dialog_manager.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';
import 'package:simply_meet/shared/view_models/loadable_model.dart';

class ToDoViewModel extends LoadableModel {
  final _dialogManager = DialogManager.singleton;
  final _localNotif = LocalNotification.singleton;
  final DateFormat _dateFormatter = DateFormat('MMM dd yyyy, hh:mm a');

  DateTime get currTime => DateTime.now();

  List<Task> modifyTaskList(List<Task> taskList, BuildContext context,
      SortFilterViewModel sortFilterViewModel) {
    var modifiedTaskList = Task.deepCopyList(taskList);

    if (sortFilterViewModel.hideComplete) {
      modifiedTaskList = modifiedTaskList
          .where((task) => task.completionStatus == false)
          .toList();
    }

    if (sortFilterViewModel.sortByDate) {
      modifiedTaskList.sort(
        (task1, task2) {
          return _compare(
            task1,
            task2,
            true,
          );
        },
      );
    }

    if (sortFilterViewModel.sortByPriority) {
      modifiedTaskList.sort(
        (task1, task2) {
          return _compare(
            task1,
            task2,
            false,
          );
        },
      );
    }

    return modifiedTaskList;
  }

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
              '${someTask.date != null ? _dateFormatter.format(someTask.date!) + ' • ' : ''}${someTask.priority}\n\n ${someTask.description}',
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

                if (!newBool! && someTask.date != null) {
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
          CustomDivider(),
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
    var scheduledTimingForNotif = task.date!.isBefore(currTime)
        ? currTime.add(Duration(seconds: 20))
        : task.date;

    return await _localNotif.scheduledNotification(
      context: context,
      notifID: task.notifID!,
      subject: task.title,
      scheduledDate: scheduledTimingForNotif!,
    );
  }

  int _priorityInInt(String priorityInString) {
    if (priorityInString == "LOW") {
      return 1;
    } else if (priorityInString == "MEDIUM") {
      return 2;
    } else {
      return 3;
    }
  }

  int _compare(Task task1, Task task2,
      [bool compareByDate = true, int defaultOrderingValue = 0]) {
    final task1Priority = _priorityInInt(task1.priority);
    final task2Priority = _priorityInInt(task2.priority);

    if (compareByDate) {
      if (task2.date == null && task1.date == null) {
        return defaultOrderingValue;
      } else if (task1.date == null) {
        return -1;
      } else if (task2.date == null) {
        return 1;
      } else if (task2.date!.compareTo(task1.date!) != 0) {
        return task2.date!.compareTo(task1.date!);
      } else if (task1Priority != task2Priority) {
        return task2Priority - task1Priority;
      } else if (task2.title != task1.title) {
        return task1.title.compareTo(task2.title);
      } else {
        return defaultOrderingValue;
      }
    } else {
      if (task1Priority != task2Priority) {
        return task2Priority - task1Priority;
      } else if (task2.date == null && task1.date == null) {
        return defaultOrderingValue;
      } else if (task1.date == null) {
        return -1;
      } else if (task2.date == null) {
        return 1;
      } else if (task2.date!.compareTo(task1.date!) != 0) {
        return task2.date!.compareTo(task1.date!);
      } else if (task2.title != task1.title) {
        return task1.title.compareTo(task2.title);
      } else {
        return defaultOrderingValue;
      }
    }
  }
}
