import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';
import 'package:timezone/data/latest.dart' as tzInitialize;
import 'package:timezone/timezone.dart' as tz;

class LocalNotification {
  static final LocalNotification _singleton = LocalNotification._();
  static LocalNotification get singleton => _singleton;
  LocalNotification._();

  final _sgTimeZone = "Asia/Singapore";

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("revamped_logo_1");

    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    //So our scheduled notif would work correctly
    tzInitialize.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(_sgTimeZone));

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> scheduledNotification({
    required BuildContext context,
    required String notifID,
    required DateTime scheduledDate,
    String? subject,
  }) async {
    var android = AndroidNotificationDetails(
      "channelID",
      "channelName",
      "channelDescription",
      color: theme(context).primaryColor,
      enableLights: true,
      enableVibration: true,
      playSound: true,
      priority: Priority.high,
      importance: Importance.high,
      icon: "revamped_logo_1",
      largeIcon: DrawableResourceAndroidBitmap("revamped_logo_1"),
      styleInformation: MediaStyleInformation(
        htmlFormatContent: true,
        htmlFormatTitle: true,
      ),
    );

    var iOS = IOSNotificationDetails();

    var platform = NotificationDetails(android: android, iOS: iOS);

    debugPrint(
        "Passed: ${DateFormat("d/M/y").add_jm().format(scheduledDate)} VS acceptd: ${tz.TZDateTime.from(scheduledDate, tz.getLocation(_sgTimeZone))},");
    return await _flutterLocalNotificationsPlugin.zonedSchedule(
      notifID.hashCode,
      "Event Reminder",
      subject ?? "Don't forget, this might be important!",
      tz.TZDateTime.from(scheduledDate, tz.getLocation(_sgTimeZone)),
      platform,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future cancelNotification([int? id]) async {
    return  id == null
        ? await _flutterLocalNotificationsPlugin.cancelAll()
        : await _flutterLocalNotificationsPlugin.cancel(id);
  }

  tz.TZDateTime convertToSGTZ(DateTime dateTime) {
    return tz.TZDateTime.from(dateTime, tz.getLocation("Asia/Singapore"));
  }

}
