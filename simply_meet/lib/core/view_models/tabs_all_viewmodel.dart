import 'package:simply_meet/core/ui/widgets/floating_bottom_modal.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

import '../ui/views/create_edit_event_view.dart';
import '../ui/views/todo_view.dart';
import '../ui/views/home_view.dart';
import '../ui/views/timetable_view.dart';

import 'package:flutter/material.dart';

class TabsAllViewModel extends ChangeNotifier {
  static const String appBar = "appBar",
      widget = "view",
      icon = "icon",
      label = "label";
  final BuildContext _context;

  int _currIdx = 0;

  TabsAllViewModel(this._context);

  List<Map<String, dynamic>> get viewMappings {
    return [
      {
        appBar: AppBar(
          title: Text("Home"),
          actions: _appBarActions,
        ),
        widget: HomeView(),
        icon: Icon(Icons.home),
        label: "Home",
      },
      {
        appBar: AppBar(
          title: Text("Timetable"),
          actions: _appBarActions,
        ),
        widget: TimetableView(),
        icon: Icon(Icons.calendar_today_rounded),
        label: "Timetable",
      },
      {
        appBar: AppBar(
          title: Text("My To-Do List"),
          actions: null,
        ),
        widget: ToDoWidget(),
        icon: Icon(Icons.checklist_rounded),
        label: "To-Do"
      }
    ];
  }

  int get currIdx => _currIdx;
  void setIndex(int newIndex) {
    _currIdx = newIndex;
    super.notifyListeners();
  }

  List<Widget> get _appBarActions {
    return [
      IconButton(
        onPressed: () async => await showFloatingModalBottomSheet(
          context: _context,
          builder: (_) => CreateEditEventView(),
        ),
        icon: const Icon(Icons.add),
        highlightColor: theme(_context).accentColor,
      ),
    ];
  }
}
