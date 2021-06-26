import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/ui/views/drawer_view.dart';
import 'package:simply_meet/core/view_models/drawer_viewmodel.dart';
import 'package:simply_meet/core/view_models/home_viewmodel.dart';
import 'package:simply_meet/core/view_models/tabs_all_viewmodel.dart';
import 'package:simply_meet/core/view_models/timetable_viewmodel.dart';
import 'package:simply_meet/shared/models/event.dart';
import 'package:simply_meet/shared/models/task.dart';
import 'package:simply_meet/shared/services/flutterfire/firestore_service.dart';
import 'package:simply_meet/shared/utility/themes.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TabsAllViews extends StatelessWidget {
  static const routeName = '/tabsAllViews';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TabsAllViewModel(context),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(controller: CalendarController()),
        ),
        ChangeNotifierProvider(
          create: (_) => TimetableViewModel(controller: CalendarController()),
        ),
        ChangeNotifierProvider(
          create: (_) => DrawerViewModel(),
        ),
        StreamProvider<List<Event>>(
          create: (_) => FirestoreService().getEventsRealTime(),
          initialData: [],
        ),
        StreamProvider<List<Task>>(
          create: (_) => FirestoreService().getTasksRealTime(),
          initialData: [],
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        )
      ],
      child: Consumer<TabsAllViewModel>(
        builder: (ctx, tabsAllViewModel, __) {
          final viewMappings = tabsAllViewModel.viewMappings;
          final currIdx = tabsAllViewModel.currIdx;

          return Consumer<ThemeProvider>(
            builder: (ctx, themeProvider, _) => Theme(
              data: themeProvider.themeType,
              child: Scaffold(
                appBar: viewMappings[currIdx][TabsAllViewModel.appBar],
                drawer: DrawerView(),
                body: viewMappings[currIdx][TabsAllViewModel.widget],
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: currIdx,
                  onTap: tabsAllViewModel.setIndex,
                  backgroundColor: themeProvider.themeType.backgroundColor,
                  showUnselectedLabels: false,
                  selectedItemColor: theme(ctx).accentColor,
                  //unselectedItemColor: Colors.white,
                  items: viewMappings
                      .map(
                        (map) => BottomNavigationBarItem(
                          icon: map[TabsAllViewModel.icon],
                          label: map[TabsAllViewModel.label],
                          backgroundColor: Colors.red,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/* class TabsAllViews extends StatelessWidget {
  static const routeName = '/tabsAllViews';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TabsAllViewModel(context),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(controller: CalendarController()),
        ),
        ChangeNotifierProvider(
          create: (_) => TimetableViewModel(controller: CalendarController()),
        ),
        ChangeNotifierProvider(
          create: (_) => DrawerViewModel(),
        ),
      ],
      builder: (ctx, __) {
        MultiProvider(providers: [StreamProvider(create: (_)=>ctx.read<HomeViewModel>()., initialData: initialData)],)
        return Consumer<TabsAllViewModel>(
          builder: (ctx, tabsAllViewModel, __) {
            final viewMappings = tabsAllViewModel.viewMappings;
            final currIdx = tabsAllViewModel.currIdx;

            return Scaffold(
              appBar: viewMappings[currIdx][TabsAllViewModel.appBar],
              drawer: DrawerView(),
              body: viewMappings[currIdx][TabsAllViewModel.widget],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: currIdx,
                onTap: tabsAllViewModel.setIndex,
                showUnselectedLabels: false,
                selectedItemColor: theme(ctx).accentColor,
                items: viewMappings
                    .map(
                      (map) => BottomNavigationBarItem(
                        icon: map[TabsAllViewModel.icon],
                        label: map[TabsAllViewModel.label],
                        backgroundColor: Colors.red,
                      ),
                    )
                    .toList(),
              ),
            );
          },
        );
      },
    );
  }
}
*/
