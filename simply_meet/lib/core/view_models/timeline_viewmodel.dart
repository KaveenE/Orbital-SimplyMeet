import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'calendar_viewmodel.dart';

class TimelineViewModel extends CalendarViewModel {
  static const ALLOWEDVIEWS = [
    CalendarView.day,
    CalendarView.week,
  ];

  TimelineViewModel({required CalendarController controller})
      : super(controller: controller);
}
