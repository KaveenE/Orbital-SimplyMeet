import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/view_models/home_viewmodel.dart';
import 'package:simply_meet/shared/models/event.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeView extends StatefulWidget {
  static const routeName = "/homeView";
  HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    final eventList = Provider.of<List<Event>>(context, listen: true);

    return SfCalendar(
      view: CalendarView.month,
      headerStyle: CalendarHeaderStyle(
        textAlign: TextAlign.right,
      ),
      firstDayOfWeek: 1,
      headerHeight: 45,
      viewHeaderHeight: 30,
      todayHighlightColor: theme(context).primaryColor,
      todayTextStyle: TextStyle(fontStyle: FontStyle.italic),
      cellBorderColor: Colors.transparent,
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
      monthViewSettings: MonthViewSettings(
        showAgenda: true,
        navigationDirection: MonthNavigationDirection.vertical,
        dayFormat: 'EEE',
        agendaItemHeight: 45,
        agendaViewHeight: 150,
        monthCellStyle: MonthCellStyle(
          backgroundColor: theme(context).accentColor.withOpacity(0.1),
          todayBackgroundColor: theme(context).accentColor.withOpacity(0.4),
        ),
        agendaStyle: AgendaStyle(
          appointmentTextStyle: TextStyle(
            fontSize: 13.5,
            fontStyle: FontStyle.italic,
          ),
          dayTextStyle: TextStyle(
            fontSize: 14.0,
            fontStyle: FontStyle.italic,
          ),
          dateTextStyle: TextStyle(
            fontSize: 13.5,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      initialSelectedDate: DateTime.now(),
      showCurrentTimeIndicator: true,
      timeZone: "Singapore Standard Time",
      dataSource: homeViewModel.dataSource(eventList),
      controller: homeViewModel.controller,
      showNavigationArrow: true,
      showDatePickerButton: true,
      onTap: (onTapDetails) =>
          homeViewModel.tapCalenderElement(onTapDetails, context),
    );
  }
}
