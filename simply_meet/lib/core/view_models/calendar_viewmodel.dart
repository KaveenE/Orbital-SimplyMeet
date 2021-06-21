import 'package:flutter/material.dart';

import 'package:simply_meet/core/ui/views/update_event_view.dart';
import 'package:simply_meet/core/ui/widgets/floating_bottom_modal.dart';
import 'package:simply_meet/shared/models/event.dart';

import 'package:simply_meet/shared/view_models/loadable_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

abstract class CalendarViewModel extends LoadableModel {
  late final CalendarController controller;

  CalendarViewModel({required this.controller});

  //Callbacks related
  void tapCalenderElement(
    CalendarTapDetails calendarTapDetails,
    BuildContext context,
  ) async {
    if (calendarTapDetails.targetElement == CalendarElement.appointment) {
      await showFloatingModalBottomSheet(
        context: context,
        builder: (_) => UpdateEventView(
            event: calendarTapDetails.appointments![0] as Event),
      );
    }
  }

  //Controller related
  CalendarController getController() => controller;

  void setControllerView(CalendarView calendarView) {
    controller.view = calendarView;
    super.notifyListeners();
  }



  EventDataSource dataSource(List<Event> events) => EventDataSource(events);
  //Used for testing
  EventDataSource dummyDataSource() => EventDataSource(_getDummyEvents);

  List<Event> get _getDummyEvents {
    final List<Event> events = <Event>[];

    events.add(Event(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      subject: 'Meeting',
      color: Colors.pink,
      isAllDay: true,
    ));
    events.add(Event(
      startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
      endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
      subject: 'Release Meeting',
      color: Colors.lightBlueAccent,
    ));
    events.add(Event(
      startTime: DateTime.now().add(const Duration(hours: 2, days: -2)),
      endTime: DateTime.now().add(const Duration(hours: 4, days: -2)),
      subject: 'Performance check',
      color: Colors.amber,
    ));
    events.add(Event(
      startTime: DateTime.now().add(const Duration(hours: 6, days: -3)),
      endTime: DateTime.now().add(const Duration(hours: 7, days: -3)),
      subject: 'Support',
      color: Colors.green,
    ));
    events.add(Event(
      startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
      endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
      subject: 'Retrospective',
      color: Colors.purple,
    ));

    return events;
  }
}
