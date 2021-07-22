import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/view_models/timeline_viewmodel.dart';
import 'package:simply_meet/shared/models/event.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TimelineView extends StatelessWidget {
  TimelineView();

  @override
  Widget build(BuildContext context) {
    final timelineViewModel =
        Provider.of<TimelineViewModel>(context, listen: false);
    final eventList = Provider.of<List<Event>>(context, listen: true);

    return SfCalendar(
      view: CalendarView.week,
      headerStyle: CalendarHeaderStyle(
        textAlign: TextAlign.right,
      ),
      firstDayOfWeek: 1,
      headerHeight: 45,
      viewHeaderHeight: 50,
      todayHighlightColor: theme(context).accentColor,
      todayTextStyle: TextStyle(fontStyle: FontStyle.italic),
      cellBorderColor: Colors.grey.shade300,
      selectionDecoration: BoxDecoration(
        border: Border.all(color: theme(context).primaryColor.withOpacity(0.5)),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        boxShadow: [
          BoxShadow(
            color: theme(context).accentColor.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      timeSlotViewSettings: TimeSlotViewSettings(
        timeIntervalHeight: 35,
        minimumAppointmentDuration: Duration(minutes: 30),
        dayFormat: 'EEE',
      ),
      allowedViews: TimelineViewModel.ALLOWEDVIEWS,
      initialSelectedDate: DateTime.now(),
      showCurrentTimeIndicator: true,
      timeZone: "Singapore Standard Time",
      dataSource: timelineViewModel.dataSource(eventList),
      controller: timelineViewModel.controller,
      showNavigationArrow: true,
      showDatePickerButton: true,
      onTap: (onTapDetails) =>
          timelineViewModel.tapCalenderElement(onTapDetails, context),
    );
  }
}
