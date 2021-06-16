import 'package:flutter/material.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

void printNavigationStack() {
  bool debug = false;
  // ignore: dead_code
  if (debug) {
    final top = _convertRouteToTruncatedString(NavigationHistoryObserver().top);

    final history = NavigationHistoryObserver()
        .history
        .map((route) => _convertRouteToTruncatedString(route))
        .toList();

    print("Top:" + top + "\n" + "History:" + history.reversed.toString());
  }
}

String _convertRouteToTruncatedString(Route<dynamic>? route) {
  final routeString = route.toString();
  return routeString.substring(0, route.toString().indexOf("animation"));
}