import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/models/event.dart';
import 'package:simply_meet/shared/services/flutterfire/firestore_service.dart';
import 'package:simply_meet/shared/utility/dialog_manager.dart';

import 'package:simply_meet/shared/view_models/loadable_model.dart';

class CreateEditEventViewModel extends LoadableModel {
  late final GlobalKey<FormBuilderState> _formKey;
  late Color _initialColor;

  CreateEditEventViewModel({
    required GlobalKey<FormBuilderState> formKey,
    required Color initialColor,
  }) {
    this._formKey = formKey;
    this._initialColor = initialColor;
  }

  Color get initialColor => _initialColor;

  void changeColor(Color newColor) {
    _initialColor = newColor;
    super.notifyListeners();
  }

  DateTime get currTime => DateTime.now();

  List<DropdownMenuItem<String>> get dropdownMenu =>
      ["ONE-TIME", "DAILY", "WEEKLY", "MONTHLY", "YEARLY"]
          .map(
            (recurrenceType) => DropdownMenuItem(
              value: recurrenceType,
              child: Text(recurrenceType),
            ),
          )
          .toList();

  Future<void> addEvent(BuildContext context) async {
    //Proceed to add to server if minimally the start/end dates are included
    if (_formKey.currentState!.validate()) {
      final firestore = Provider.of<FirestoreService>(context, listen: false);
      final mapForInputs = _formKey.currentState!.fields;
      final is1Time = mapForInputs["recurrenceType"]!
              .value
              .toString()
              .compareTo("ONE-TIME") ==
          0;

      final eventToAdd = Event(
        startTime: mapForInputs["startDate"]!.value,
        endTime: mapForInputs["endDate"]!.value,
        color: mapForInputs["color"]!.value,
        description: mapForInputs["description"]!.value,
        isAllDay: mapForInputs["allDay"]!.value,
        subject: mapForInputs["subject"]!.value,
        recurrenceRule:
            is1Time ? null : 'FREQ=' + mapForInputs["recurrenceType"]!.value,
      );

      super.setBusy(true);

      final response = await firestore.addEvent(eventToAdd);
      final dialogManager = DialogManager.singleton;
      super.setBusy(false);

      if (response == null) {
        dialogManager.defaultSuccessDialog(
            title: "Event added", description: "", context: context)
          ..show().then((_) => Navigator.pop(context));
        ;
      } else {
        dialogManager.defaultErrorDialog(
            title: "Failed to added event",
            description: response,
            context: context)
          ..show();
      }
    }
  }

  Future<void> updateEvent(BuildContext context, Event event) async {
    //Proceed to add to server if minimally the start/end dates are included
    if (_formKey.currentState!.validate()) {
      final firestore = Provider.of<FirestoreService>(context, listen: false);
      final mapForInputs = _formKey.currentState!.fields;
      

      final eventToUpdate = Event(
          startTime: mapForInputs["startDate"]!.value,
          endTime: mapForInputs["endDate"]!.value,
          color: mapForInputs["color"]!.value,
          description: mapForInputs["description"]!.value,
          isAllDay: mapForInputs["allDay"]!.value,
          subject: mapForInputs["subject"]!.value,
          recurrenceRule: _rruleStringConverter(
            mapForInputs["recurrenceType"]!.value,
            mapForInputs["startDate"]!.value,
          ),
          documentIDFireStore: event.documentIDFireStore);

      super.setBusy(true);

      final response = await firestore.updateEvent(eventToUpdate);
      final dialogManager = DialogManager.singleton;
      super.setBusy(false);

      if (response == null) {
        dialogManager.defaultSuccessDialog(
            title: "Event updated", description: "", context: context)
          ..show().then((_) => Navigator.pop(context));
        ;
      } else {
        dialogManager.defaultErrorDialog(
            title: "Failed to update event",
            description: response,
            context: context)
          ..show();
      }
    }
  }

  String? _rruleStringConverter(String freqValue, DateTime startDate) {
    final prefix = 'FREQ=';

    if (freqValue == "ONE-TIME") {
      return null;
    } else if (freqValue == "DAILY") {
      return prefix + freqValue + ";";
    } else if (freqValue == "WEEKLY") {
      return prefix +
          freqValue +
          ";" +
          "BYDAY=" +
          _intToDayConverter(startDate.weekday) +
          ";" +
          "INTERVAL=1";
    } else if (freqValue == "MONTHLY") {
      return prefix +
          freqValue +
          ";" +
          "BYMONTHDAY=" +
          startDate.day.toString() +
          ";" +
          "INTERVAL=1";
    } else {
      return prefix +
          freqValue +
          ";" +
          "BYMONTH=" +
          startDate.month.toString() +
          ";" +
          "BYMONTHDAY=" +
          startDate.day.toString() +
          ";";
    }
  }

  String _intToDayConverter(int n) {
    final String day;

    switch (n) {
      case 1:
        {
          day = "MO";
        }
        break;
      case 2:
        {
          day = "TU";
        }
        break;
      case 3:
        {
          day = "WE";
        }
        break;
      case 4:
        {
          day = "TH";
        }
        break;
      case 5:
        {
          day = "FR";
        }
        break;
      case 6:
        {
          day = "SA";
        }
        break;
      case 7:
        {
          day = "SU";
        }
        break;
      default:
        {
          debugPrint("Can't convert int to day");
          day = "GAY";
        }
    }

    return day;
  }
}
