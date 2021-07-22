import 'package:simply_meet/core/ui/views/sortfilter_view.dart';
import 'package:simply_meet/core/ui/views/todo_view.dart';
import 'package:simply_meet/core/ui/widgets/floating_bottom_modal.dart';

import 'package:simply_meet/shared/utility/ui_helpers.dart';

import '../ui/views/create_edit_event_view.dart';
import '../ui/views/home_view.dart';
import '../ui/views/timeline_view.dart';

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
          actions: _appBarActionsForEvents,
        ),
        widget: HomeView(),
        icon: Icon(Icons.home_filled),
        label: "Home",
      },
      {
        appBar: AppBar(
          title: Text("Timeline"),
          actions: _appBarActionsForEvents,
        ),
        widget: TimelineView(),
        icon: Icon(
          Icons.calendar_today_rounded,
          size: 21,
        ),
        label: "Timeline",
      },
      {
        appBar: AppBar(
          title: Text("My To-Do List"),
          actions: _appBarActionsForReminders,
        ),
        widget: ToDoView(),
        icon: Icon(
          Icons.checklist_rounded,
          size: 25,
        ),
        label: "To-Do"
      }
    ];
  }

  int get currIdx => _currIdx;
  void setIndex(int newIndex) {
    _currIdx = newIndex;
    super.notifyListeners();
  }

  List<Widget> get _appBarActionsForEvents {
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

  List<Widget> get _appBarActionsForReminders {
    return <Widget>[
      IconButton(
        onPressed: () async => await showFloatingModalBottomSheet(
          context: _context,
          builder: (_) => SortFilterView(),
        ),
        icon: const Icon(Icons.filter_alt_outlined),
        highlightColor: theme(_context).accentColor,
      ),
    ];
  }
}
