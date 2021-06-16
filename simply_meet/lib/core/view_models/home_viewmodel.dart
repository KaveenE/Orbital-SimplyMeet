import 'package:flutter/cupertino.dart';
import 'package:simply_meet/core/ui/views/update_event_view.dart';
import 'package:simply_meet/core/ui/widgets/floating_bottom_modal.dart';
import 'package:simply_meet/core/view_models/calendar_viewmodel.dart';
import 'package:simply_meet/shared/models/event.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeViewModel extends CalendarViewModel {
  HomeViewModel({required CalendarController controller})
      : super(controller: controller);

  @override
  void longPressCalenderElement(
    CalendarLongPressDetails calendarLongPressDetails,
    BuildContext context,
  ) async {

    if (calendarLongPressDetails.targetElement == CalendarElement.appointment) {
      await showFloatingModalBottomSheet(
        context: context,
        builder: (_) => UpdateEventView(event: calendarLongPressDetails.appointments![0] as Event),
      );
    }
  }
}
