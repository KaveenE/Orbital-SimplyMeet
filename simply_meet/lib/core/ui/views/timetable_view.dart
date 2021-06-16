import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/view_models/timetable_viewmodel.dart';
import 'package:simply_meet/shared/models/event.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TimetableView extends StatelessWidget {
  TimetableView();

  @override
  Widget build(BuildContext context) {
    final timetableViewModel =
        Provider.of<TimetableViewModel>(context, listen: false);
    final eventList = Provider.of<List<Event>>(context, listen: true);
    print(eventList);
    return SfCalendar(
      //Aesthetics baby
      view: CalendarView.week,
      headerStyle: CalendarHeaderStyle(
        textAlign: TextAlign.center,
      ),
      //Aesthetics, date specific
      allowedViews: TimetableViewModel.ALLOWEDVIEWS,
      initialSelectedDate: DateTime.now(),
      showCurrentTimeIndicator: true,
      timeZone: "Singapore Standard Time",
      dataSource: timetableViewModel.dataSource(eventList),
      controller: timetableViewModel.controller,
      showNavigationArrow: true,
      //Callbacks. Too expensive, whatsapp yo
      onLongPress: (longPressDetails) => timetableViewModel
          .longPressCalenderElement(longPressDetails, context),
    );
  }
}
