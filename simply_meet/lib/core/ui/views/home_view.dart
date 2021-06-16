import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/view_models/home_viewmodel.dart';
import 'package:simply_meet/shared/models/event.dart';
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
      //Aesthetics baby
      view: CalendarView.month,
      headerStyle: CalendarHeaderStyle(
        textAlign: TextAlign.center,
      ),
      monthViewSettings: MonthViewSettings(showAgenda: true),
      //Aesthetics, date specific
      initialSelectedDate: DateTime.now(),
      showCurrentTimeIndicator: true,
      timeZone: "Singapore Standard Time",
      dataSource: homeViewModel.dataSource(eventList),
      controller: homeViewModel.controller,
      showNavigationArrow: true,
      //Callbacks. Too expensive, whatsapp yo
      onLongPress: (longPressDetails) =>
          homeViewModel.longPressCalenderElement(longPressDetails, context),
    );
  }
}
