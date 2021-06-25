import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
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
      largeIcon: DrawableResourceAndroidBitmap("revamped_logo_1"),
      styleInformation: MediaStyleInformation(
        htmlFormatContent: true,
        htmlFormatTitle: true,
      ),
    );

    var iOS = IOSNotificationDetails();

    var platform = NotificationDetails(android: android, iOS: iOS);

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
    return await id == null
        ? _flutterLocalNotificationsPlugin.cancelAll()
        : _flutterLocalNotificationsPlugin.cancel(id!);
  }

  tz.TZDateTime convertToSGTZ(DateTime dateTime) {
    return tz.TZDateTime.from(dateTime, tz.getLocation("Asia/Singapore"));
  }
  /*
  Future<String> get _getLocalTimeZone async {
    final timezone = await FlutterNativeTimezone.getLocalTimezone();

    return timezone == "GMT" ? "Etc/GMT" : timezone;
  }*/
}