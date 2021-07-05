import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/models/task.dart';
import 'package:simply_meet/shared/services/flutterfire/firestore_service.dart';
import 'package:simply_meet/shared/services/local_notif.dart';
import 'package:simply_meet/shared/utility/dialog_manager.dart';
import 'package:simply_meet/shared/view_models/loadable_model.dart';

class AddTasksViewModel extends LoadableModel {
  late final GlobalKey<FormBuilderState> _formKey;

  final _dialogManager = DialogManager.singleton;
  final _localNotif = LocalNotification.singleton;

  AddTasksViewModel({
    required GlobalKey<FormBuilderState> formKey,
  }) {
    this._formKey = formKey;
  }

  DateTime get currTime => DateTime.now();
  List<DropdownMenuItem<String>> get dropdownMenu => ["LOW", "MEDIUM", "HIGH"]
      .map(
        (priority) => DropdownMenuItem(
          value: priority,
          child: Text(
            priority,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      )
      .toList();

  Future<void> updateTask(BuildContext context, Task task) async {
    //Proceed to add to server if minimally the start/end dates are included
    if (_formKey.currentState!.validate()) {
      final firestore = Provider.of<FirestoreService>(context, listen: false);
      final mapForInputs = _formKey.currentState!.fields;

      final taskToUpdate = Task(
        date: mapForInputs["date"]!.value,
        notifID: task.notifID,
        priority: mapForInputs["priority"]!.value,
        description: mapForInputs["description"]!.value,
        title: mapForInputs["title"]!.value,
        documentIDFireStore: task.documentIDFireStore,
      );

      super.setBusy(true);

      await _localNotif.cancelNotification(taskToUpdate.notifID.hashCode);
      final response = await firestore.updateTask(taskToUpdate);

      if(mapForInputs["date"]!.value != null)
      await _scheduleNotification(taskToUpdate, context);

      super.setBusy(false);

      if (response == null) {
        _dialogManager.defaultSuccessDialog(
            title: "Task updated", description: "", context: context)
          ..show().then((_) => Navigator.pop(context));
      } else {
        _dialogManager.defaultErrorDialog(
            title: "Failed to update task",
            description: response,
            context: context)
          ..show();
      }
    }
  }

  Future<void> addTask(BuildContext context) async {
    //Proceed to add to server if minimally the start/end dates are included
    if (_formKey.currentState!.validate()) {
      final firestore = Provider.of<FirestoreService>(context, listen: false);
      final mapForInputs = _formKey.currentState!.fields;

      final taskToAdd = Task(
        date: mapForInputs["date"]!.value,
        notifID: Task.uuid.v4(),
        priority: mapForInputs["priority"]!.value,
        title: mapForInputs["title"]!.value,
        description: mapForInputs["description"]!.value,
      );

      super.setBusy(true);

      final response = await firestore.addTask(taskToAdd);

      if(mapForInputs["date"]!.value != null)
      await _scheduleNotification(taskToAdd, context);

      super.setBusy(false);

      if (response == null) {
        _dialogManager.defaultSuccessDialog(
            title: "Task added", description: "", context: context)
          ..show().then((_) => Navigator.pop(context));
      } else {
        _dialogManager.defaultErrorDialog(
            title: "Failed to add task",
            description: response,
            context: context)
          ..show();
      }
    }
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
}
