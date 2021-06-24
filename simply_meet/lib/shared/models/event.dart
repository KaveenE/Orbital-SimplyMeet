import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  static const uuid = Uuid();

  String? recurrenceRule;
  final bool isAllDay;
  final String description;

  @JsonKey(toJson: _dateTimeToJson, fromJson: _dateTimeFromJson)
  final DateTime startTime;
  @JsonKey(toJson: _dateTimeToJson, fromJson: _dateTimeFromJson)
  final DateTime endTime;

  final String subject;

  @JsonKey(toJson: _colorToJson, fromJson: _colorFromJson)
  final Color color;

  @JsonKey(includeIfNull: false)
  final String? documentIDFireStore;

  final String? startTimeZone;
  final String? endTimeZone;
  final String? notifID;

  Event({
    this.startTimeZone = "Singapore Standard Time",
    this.endTimeZone = "Singapore Standard Time",
    this.documentIDFireStore,
    this.recurrenceRule,
    this.isAllDay = false,
    this.description = '',
    required this.startTime,
    required this.endTime,
    required this.notifID,
    this.subject = 'No subject',
    this.color = Colors.lightBlue,
  });

  Map<String, dynamic> toJson() => _$EventToJson(this);
  factory Event.fromJson(Map<String, dynamic> json, String? documentID) =>
      _$EventFromJson(json, documentID);

  factory Event.deepCopy(Event another) {
    return Event(
      endTime: another.endTime,
      startTime: another.startTime,
      notifID: another.notifID,
      color: another.color,
      documentIDFireStore: another.documentIDFireStore,
      isAllDay: another.isAllDay,
      description: another.description,
      recurrenceRule: another.recurrenceRule,
      subject: another.subject,
      endTimeZone: another.endTimeZone,
      startTimeZone: another.startTimeZone,
    );
  }

  static List<Event> deepCopyList(List<Event> anotherListOfEvents) {
    List<Event> defensiveCopy = [];

    for (final event in anotherListOfEvents) {
      defensiveCopy.add(Event.deepCopy(event));
    }

    return defensiveCopy;
  }

  //Helper functions for @JsonKey
  static String _dateTimeToJson(DateTime dateTime) =>
      DateFormat("d/M/y").add_jm().format(dateTime);

  static DateTime _dateTimeFromJson(String dateTime) =>
      DateFormat("d/M/y").add_jm().parse(dateTime);

  static String _colorToJson(Color color) => color.value.toRadixString(16);

  static Color _colorFromJson(String colorString) =>
      Color(int.parse(colorString, radix: 16));
  @override
  String toString() =>
      "Start Time: ${this.startTime}. End Time: ${this.endTime}.\nSubject: $subject. Description: $description";
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> source) {
    this.appointments = source;
  }

  @override
  DateTime getStartTime(int index) => (appointments![index] as Event).startTime;

  @override
  DateTime getEndTime(int index) => (appointments![index] as Event).endTime;

  @override
  Color getColor(int index) => (appointments![index] as Event).color;

  @override
  String? getRecurrenceRule(int index) =>
      (appointments![index] as Event).recurrenceRule;

  @override
  String getSubject(int index) => (appointments![index] as Event).subject;

  @override
  String getNotes(int index) => (appointments![index] as Event).description;

  @override
  bool isAllDay(int index) => (appointments![index] as Event).isAllDay;

  @override
  String? getEndTimeZone(int index) => (appointments![index] as Event).endTimeZone;

  @override
  String? getStartTimeZone(int index) => (appointments![index] as Event).startTimeZone;
}
