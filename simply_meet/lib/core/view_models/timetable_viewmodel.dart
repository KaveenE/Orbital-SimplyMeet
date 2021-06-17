import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'calendar_viewmodel.dart';

class TimetableViewModel extends CalendarViewModel {
  static const ALLOWEDVIEWS = [
    CalendarView.day,
    CalendarView.week,
  ];

  TimetableViewModel({required CalendarController controller})
      : super(controller: controller);


}
